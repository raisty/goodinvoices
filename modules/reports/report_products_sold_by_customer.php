<?php   /* ToDo: find chart with two strings */
require_once("./include/sql2json.php");

   $sSQL = "SELECT sum(ii.quantity) as sum_quantity, c.name, p.description
      FROM ".TB_PREFIX."customers c INNER JOIN
      ".TB_PREFIX."invoices iv ON (c.id = iv.customer_id) INNER JOIN
      ".TB_PREFIX."invoice_items ii ON (iv.id = ii.invoice_id) INNER JOIN
      ".TB_PREFIX."products p ON (p.id = ii.product_id)
      WHERE p.visible
      GROUP BY p.description, c.name
      ORDER BY c.name";

$cols=Array(/*Array("label"=>"service","type"=>"string"),*/Array("label"=>"company","type"=>"string"),Array("label"=>$LANG["summary"],"type"=>"number"));
$rows=Array(/*Array("description","string",false),*/Array("name","string",false),Array("sum_quantity","int",false));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'AreaChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>