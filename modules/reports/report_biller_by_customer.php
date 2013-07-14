<?php   /* ToDo: find chart with two strings */
//   include phpreports library
require_once("./include/sql2json.php");

// Adjusted for NULL on computation with NULL values
 /*  $sSQL = "SELECT
      sum(ii.total) AS sum_total,
         b.name AS bname,
         c.name AS cname
      FROM ".TB_PREFIX."biller b INNER JOIN
      ".TB_PREFIX."invoices iv ON (b.id = iv.biller_id) INNER JOIN
      ".TB_PREFIX."customers c ON (c.id = iv.customer_id) INNER JOIN
      ".TB_PREFIX."invoice_items ii ON (iv.id = ii.invoice_id)
      GROUP BY b.name, c.name";
*/
	$sSQL  = "SELECT sum(ivt.total) as SUM_TOTAL, b.name as Biller, c.name as Customer
FROM ".TB_PREFIX."biller b, ".TB_PREFIX."customers c,
".TB_PREFIX."invoice_items ivt, ".TB_PREFIX."invoices iv
WHERE iv.customer_id = c.id AND iv.biller_id = b.id AND iv.id = ivt.invoice_id
GROUP BY b.name, c.name";

$cols=Array(/*Array("label"=>"biller","type"=>"string"),*/Array("label"=>"customer","type"=>"string"),Array("label"=>$LANG["summary"],"type"=>"number"));
$rows=Array(/*Array("Biller","string",false),*/Array("Customer","string",false),Array("SUM_TOTAL","int",false));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'AreaChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>
