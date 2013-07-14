<?php 
   $sSQL = "select sum(ii.total) as total 
            from 
                ".TB_PREFIX."invoice_items ii,
                ".TB_PREFIX."invoices i,
                ".TB_PREFIX."preferences p
            where
                i.preference_id = p.pref_id
                and 
                i.id = ii.invoice_id
                and
                p.status = '1';
                ";

$data_sql = dbQuery($sSQL) or die(end($dbh->errorInfo()));
$data = $data_sql->fetch();
if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
$data_value = money_format($format,(int)$data[0]).$symb;

$smarty -> assign('showReport', $data_value);
$smarty -> assign('pageActive', 'report_sale');
$smarty -> assign('active_tab', '#money');
?>
