<?php
//   include phpreports library
require_once("./include/sql2json.php");

   if ($db_server == 'pgsql') {
      $sSQL = "SELECT
        iv.id,
        b.name AS biller,
        c.name AS customer,

        coalesce(ii.total, 0) AS inv_total,
        coalesce(ap.total, 0) AS inv_paid,
        coalesce(ii.total, 0) - coalesce(ap.total, 0) AS inv_owing,
        iv.date
FROM
        ".TB_PREFIX."invoices iv INNER JOIN
	".TB_PREFIX."customers c ON (c.id = iv.customer_id) INNER JOIN
	".TB_PREFIX."biller b ON (b.id = iv.biller_id) LEFT JOIN
        (SELECT i.invoice_id, sum(i.total) AS total
         FROM ".TB_PREFIX."invoice_items i GROUP BY i.invoice_id
        ) ii ON (iv.id = ii.invoice_id) LEFT JOIN
        (SELECT p.ac_inv_id, sum(p.ac_amount) AS total
         FROM ".TB_PREFIX."payment p GROUP BY p.ac_inv_id
        ) ap ON (iv.id = ap.ac_inv_id)
ORDER BY
        inv_owing DESC
LIMIT 0,10;
";
   } else {
      $sSQL = "SELECT
        i.id,
        (select name from " . TB_PREFIX . "biller b where b.id = i.biller_id) as biller,
        (select name from " . TB_PREFIX . "customers c where c.id = i.customer_id) as customer,
        (select sum(coalesce(ii.total, 0)) from " . TB_PREFIX . "invoice_items ii WHERE ii.invoice_id = i.id) as inv_total,
        (select sum(coalesce(ap.ac_amount, 0)) from " . TB_PREFIX . "payment ap where  ap.ac_inv_id = i.id ) as inv_paid,
        (select coalesce(INV_TOTAL,0) - coalesce(INV_PAID,0)) as inv_owing ,
        date
FROM
        " . TB_PREFIX . "invoices i
HAVING 
        inv_owing > 0
ORDER BY
        inv_owing DESC
LIMIT 0,10;
";
   }

$cols=Array(Array("label"=>"name","type"=>"string"),Array("label"=>$LANG['dept_owing'],"type"=>"number"),Array("label"=>$LANG['dept_payed'],"type"=>"number"),Array("label"=>$LANG['dept_summary'],"type"=>"number"));
$rows=Array(Array("customer","string",false),Array("inv_owing","int",true),Array("inv_paid","int",true),Array("inv_total","int",true));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'BarChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>