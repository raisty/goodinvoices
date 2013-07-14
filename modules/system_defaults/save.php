<?php

checkLogin();

# Deal with op and add some basic sanity checking

$saved = false;
$defaults = getSystemDefaults();

error_log($_POST['name']."  ".$_POST['value']);

if (isset($_POST['op']) && $_POST['op'] == 'update_system_defaults' ) {
	
	if(isset($defaults[$_POST['name']])) {
  
  if(updateDefault($_POST['name'],$_POST['value'])) {
		$saved = true;
	}
	
	} else {
  
  if(insertDefault($_POST['name'],$_POST['value'])) {
		$saved = true;
	}
  
  }
}
$smarty -> assign("saved",$saved);

$smarty -> assign('pageActive', 'system_default');
$smarty -> assign('active_tab', '#setting');
?>
