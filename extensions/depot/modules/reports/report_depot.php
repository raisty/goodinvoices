<?php
checkLogin();

$key="";
$limit=20;

$smarty -> assign('Gdocskey', $key);
$smarty -> assign('Gdocslimit', $limit);

$smarty -> assign('pageActive', 'report_depot');
$smarty -> assign('active_tab', '#depot');
?>