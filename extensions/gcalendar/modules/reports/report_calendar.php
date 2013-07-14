<?php
checkLogin();

$key="";
$timezone="Europe/Berlin";
$weekstart="monday"; //sunday, monday, saturday


switch($weekstart) {
  case "sunday":
  $weekstart="1";
  break;
  case "monday":
  $weekstart="2";
  break;
  case "saturday":
  $weekstart="3";
  break;
  default:
  $weekstart="2";
}
$timezone=urlencode($timezone);
$smarty -> assign('Gcalkey', $key);
$smarty -> assign('Gcaltz', $timezone);
$smarty -> assign('Gcalwkst', $weekstart);

$smarty -> assign('pageActive', 'report_calendar');
$smarty -> assign('active_tab', '#calendar');
?>