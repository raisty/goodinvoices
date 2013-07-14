<?php
function sql2json($sql,$name,$cols=Array(),$rows=Array()) {
    $data_sql = dbQuery($sql) or die(end($dbh->errorInfo()));
    $out=Array(
      "cols"=>Array(),
      "rows"=>Array()
    );  
    
    $data = $data_sql->fetchAll(PDO::FETCH_ASSOC);
    
    $out["cols"]=$cols;
    
    foreach($data as $value) {
      unset($in_arr);
      for($i=0;$i<count($rows);$i++) {
        if($rows[$i][1]=="int" || $rows[$i][1]=="integer") {
          if($rows[$i][2]===true) {
            if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
            $r_arr=Array("v"=>(int)$value[$rows[$i][0]],"f"=>money_format($format,(int)$value[$rows[$i][0]]).$symb);
          } else {
            $r_arr=Array("v"=>(int)$value[$rows[$i][0]]);
          }
        } elseif($rows[$i][1]=="static_int") {
          if($rows[$i][2]===true) {
            if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
            $r_arr=Array("v"=>(int)$rows[$i][0],"f"=>money_format($format,(int)$rows[$i][0]).$symb);
          } else {
            $r_arr=Array("v"=>(int)$rows[$i][0]);
          }
        } elseif($rows[$i][1]=="static_str") {
          $r_arr=Array("v"=>(string)$rows[$i][0]);
        } else {
          $r_arr=Array("v"=>(string)$value[$rows[$i][0]]);
        }
        
        $in_arr[]=$r_arr;
      }
      
      $row_arr=$in_arr;
        
      $out["rows"][]["c"] = $row_arr;
    }  
    
    $out["p"][]=Array("className"=>$name);
    
    $encoded = json_encode($out);
    return $encoded;
}
?>