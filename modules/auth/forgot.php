<?php
$priv_key="";  //reCaptcha
$pub_key="";

function sendmail($mail,$pass,$LANG) {
  $to=$mail;
  $server=$_SERVER['SERVER_NAME'];
  $ip=$_SERVER['REMOTE_ADDR'];
  $from="admin@".$server;
  $body=$LANG['forgotmail_intro_1'].$ip.
        $LANG['forgotmail_intro_2'].gethostbyaddr($ip).
        $LANG['forgotmail_intro_3'].$pass.
        $LANG['forgotmail_intro_4'].
        "<br /><a href=\"http://".$server."\" target=\"_blank\">".$LANG['forgotmail_intro_5']."</a>"; 
  $subject=$LANG['forgotmail_subject'];
  
  $headers = "MIME-Version: 1.0\r\n"; 
  $headers .= "Content-type: text/html; charset=utf-8\r\n"; 
  $headers .= "From: ".$from."\r\n";
  $headers .= "Reply-To: ".$from."\r\n";
  $headers .= "X-Mailer: ".$LANG['simple_invoices']."\r\n"; 
  
  $mail_status=mail($to,$subject,$body,$headers);
  return $mail_status;
}

function generate_pass($length=0) {
  $salt=rand(1,9);
  if($length==0) { $length=rand(10,20); }
  $pass = substr(md5((rand()*$salt).mt_rand()), 0, $length);
  $upass = strtoupper($pass);
  return $upass;
}

$menu = false;
define("BROWSE","browse");
$errorMessage='';

if($priv_key!="" && $pub_key!="") {
require_once('include/recaptcha/recaptchalib.php');
$recap=true;
$smarty->assign("recaptcha",recaptcha_get_html($pub_key));
} else {
$recap=false;
$smarty->assign("recaptcha","");
}

if($_POST['action']=='forgot') {

if(!empty($_POST['email'])) 
{

  if($recap===true) {
    $resp = recaptcha_check_answer ($priv_key,
                                $_SERVER["REMOTE_ADDR"],
                                $_POST["recaptcha_challenge_field"],
                                $_POST["recaptcha_response_field"]);
  }
  
  if(($recap===false) || ($recap===true && $resp->is_valid)) {
  
     //sql patch 161 changes user table name - need to accomodate
  	 $user_table = (getNumberOfDoneSQLPatches() < "161") ? "users" : "user";
  	 $user_email = (getNumberOfDoneSQLPatches() < "184") ? "user_email" : "email";
  	 $user_password = (getNumberOfDoneSQLPatches() < "184") ? "user_password" : "password";
  	 $userEmail  = htmlspecialchars(addslashes($_POST['email']));
  	 
  	 $identitySQL = "SELECT count(`email`),`email`,`id` FROM `".TB_PREFIX."user` WHERE `email`='".$userEmail."' LIMIT 0,1;";
				
		 $row = dbQuery($identitySQL);
		 $ident = $row->fetch(PDO::FETCH_NUM);
		 
  		if ($ident[0]==1) {
  			
        $newpass=generate_pass(0); echo "_";
  			$user_password = md5($newpass);
        
        $updateSQL = "UPDATE `".TB_PREFIX."user` SET `password` = '".$user_password."' WHERE `".TB_PREFIX."user`.`id` =".$ident[2].";";
        $updating = dbQuery($updateSQL);
  			
        if($updating) {
          $send_mail = sendmail($userEmail,$newpass,$LANG);
          
          if($send_mail) {
            $errorMessage = $LANG['forgotsended'];
            
            //redirect
            echo "<meta http-equiv=\"refresh\" content=\"5;url=http://".$_SERVER['SERVER_NAME']."\">";
            
          } else {
            $errorMessage = $LANG['forgotcannotemailed'];
          }
          
        } else {
          $errorMessage = $LANG['forgotcanotsaved'];
        }
        
  		} else {
        $errorMessage = $LANG['forgotmismatch'];
      }
  
  }
  else
  {
  $errorMessage = $LANG['captchafail'];
  }

}
else
{
$errorMessage = $LANG['no_forgotemail'];
}

}
 
$smarty->assign("errorMessage",$errorMessage);
?>
