<?php

   $sSQL = "select sum(ii.tax_amount) as sum_tax_total from ".TB_PREFIX."invoice_items ii";

$data_sql = dbQuery($sSQL) or die(end($dbh->errorInfo()));
$data = $data_sql->fetch();
if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
$data_value = money_format($format,(int)$data[0]).$symb;

$smarty -> assign('showReport', $data_value);
$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>