<?php 
//   include phpreports library
require_once("./include/sql2json.php");

   $sSQL = "SELECT c.name, sum(ii.total) as sum_total
      FROM 
            ".TB_PREFIX."customers c, 
            ".TB_PREFIX."invoices i,
            ".TB_PREFIX."invoice_items ii, 
            ".TB_PREFIX."preferences p
    where
        i.customer_id = c.id
        AND
        ii.invoice_id = i.id
        AND 
        i.preference_id = p.pref_id
        AND
            p.status = '1'
      GROUP BY c.name 

";

$cols=Array(Array("label"=>$LANG['company_name'],"type"=>"string"),Array("label"=>$LANG['sum_total'],"type"=>"number"));
$rows=Array(Array("name","string",false),Array("sum_total","int",true));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'PieChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>
