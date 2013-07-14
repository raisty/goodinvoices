<?php 
require_once("./include/sql2json.php");

   $sSQL = "SELECT p.description, sum(ii.quantity) AS sum_quantity
      FROM ".TB_PREFIX."invoice_items ii INNER JOIN
      ".TB_PREFIX."invoices iv ON (ii.invoice_id = iv.id) INNER JOIN
      ".TB_PREFIX."products p ON (p.id = ii.product_id)
      WHERE p.visible GROUP BY p.description";

$cols=Array(Array("label"=>"name","type"=>"string"),Array("label"=>"value","type"=>"number"));
$rows=Array(Array("description","string",false),Array("sum_quantity","int",true));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'PieChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>