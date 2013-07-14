<?php
//   include phpreports library
require_once("./include/sql2json.php");

   $sSQL = "SELECT 
                b.name, 
                sum(ii.total) AS sum_total
            FROM 
                ".TB_PREFIX."biller b 
            INNER JOIN
              ".TB_PREFIX."invoices iv ON (b.id = iv.biller_id)
            INNER JOIN
              ".TB_PREFIX."invoice_items ii ON (ii.invoice_id = iv.id)
            INNER JOIN
              ".TB_PREFIX."preferences p ON (p.pref_id = iv.preference_id)
            WHERE
                p.status ='1'
            GROUP BY 
                b.name";
                
$cols=Array(Array("label"=>"name","type"=>"string"),Array("label"=>"value","type"=>"number"));
$rows=Array(Array("name","string",false),Array("sum_total","int",true));
$json = sql2json($sSQL,"graph",$cols,$rows);

$smarty -> assign('showReport', $json);
$smarty -> assign('charttype', 'PieChart');

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>