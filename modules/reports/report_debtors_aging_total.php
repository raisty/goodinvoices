<?php
//   include phpreports library
require_once("./include/sql2json.php");

   if ($db_server == 'pgsql') {
      $sSQL = "SELECT
        sum(coalesce(ii.total, 0)) AS inv_total,
        sum(coalesce(ap.ac_amount, 0)) AS inv_paid,

        sum(coalesce(ii.total, 0)) -
        sum(coalesce(ap.ac_amount, 0)) AS inv_owing,

        (CASE   WHEN age(iv.date) <= '14 days'::interval THEN '0-14'
                WHEN age(iv.date) <= '30 days'::interval THEN '15-30'
                WHEN age(iv.date) <= '60 days'::interval THEN '31-60'
                WHEN age(iv.date) <= '90 days'::interval THEN '61-90'
                ELSE '90+'
        END) AS aging

FROM
        ".TB_PREFIX."invoices iv LEFT JOIN
        (SELECT i.invoice_id, sum(i.total) AS total
         FROM ".TB_PREFIX."invoice_items i GROUP BY i.invoice_id
        ) ii ON (iv.id = ii.invoice_id) LEFT JOIN
        (SELECT p.ac_inv_id, sum(p.ac_amount) AS ac_amount
         FROM ".TB_PREFIX."payment p GROUP BY p.ac_inv_id
        ) ap ON (iv.id = ap.ac_inv_id)
GROUP BY
        aging
ORDER BY
	aging DESC;
";
   } else {
      $sSQL = "SELECT
        sum(coalesce(ii.total, 0)) AS inv_total,
        sum(coalesce(ap.ac_amount, 0)) AS inv_paid,

        sum(coalesce(ii.total, 0)) -
        sum(coalesce(ap.ac_amount, 0)) AS inv_owing,

        (CASE   WHEN datediff(now(),date) <= '14 days' THEN '0-14'
                WHEN datediff(now(),date) <= '30 days' THEN '15-30'
                WHEN datediff(now(),date) <= '60 days' THEN '31-60'
                WHEN datediff(now(),date) <= '90 days' THEN '61-90'
                ELSE '90+'
        END) AS aging

FROM
        ".TB_PREFIX."invoices iv LEFT JOIN
        (SELECT i.invoice_id, sum(i.total) AS total
         FROM ".TB_PREFIX."invoice_items i GROUP BY i.invoice_id
        ) ii ON (iv.id = ii.invoice_id) LEFT JOIN
        (SELECT p.ac_inv_id, sum(p.ac_amount) AS ac_amount
         FROM ".TB_PREFIX."payment p GROUP BY p.ac_inv_id
        ) ap ON (iv.id = ap.ac_inv_id)
GROUP BY
        aging
ORDER BY
	aging DESC;
";
}

$cols=Array(Array("label"=>"aging","type"=>"string"),Array("label"=>$LANG['dept_summary'],"type"=>"number"),Array("label"=>$LANG['dept_owing'],"type"=>"number"),Array("label"=>$LANG['dept_payed'],"type"=>"number"));
$rows=Array(Array("aging","string",false),Array("inv_total","int",true),Array("inv_owing","int",true),Array("inv_paid","int",true));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'ColumnChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>