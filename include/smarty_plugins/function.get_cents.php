<?php

  function smarty_function_get_cents($params,$smarty) {
    $euros = $params['number'];
    if($euros!="" && $euros<0) {
      $euros_rel = -$euros;
      $euros_floor = floor(-$euros);
      $cents = ($euros_rel-$euros_floor);
      printf("%.2F",round($cents,2));
    } elseif($euros!="") {
      $euros_floor = floor($euros);
      $cents = ($euros-$euros_floor);
      printf("%.2F",round($cents,2));
    } elseif($euros=="" || $euros==0) {
      echo "0,00";
    } else {
      echo "";
    }
  }

?>