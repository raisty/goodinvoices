<?php

/*
* Script: report_sales_by_period.php
* 	Sales reports by period add page
*
* Authors:
*	 Jok & Max
*
* Last edited:
* 	 2012-05-13
*
* License:
*	 GPL v3
*
* Website:
* 	http://www.simpleinvoices.org
*/

checkLogin();


/*
* Get earliest invoice date
*/
$sql="select min(date) as date from ".TB_PREFIX."invoices";
$sth = dbQuery($sql) or die(htmlsafe(end($dbh->errorInfo())));
$invoice_start_array = $sth->fetch();

//$invoice_start = dbQuery($sql);
//$invoice_start_array= mysql_fetch_array($invoice_start);
$first_invoice_year = date('Y', strtotime( $invoice_start_array['date'] ) );
/*
* Get total for each month of each year from first invoice
*/
$this_year= date('Y');
if(isset($_GET["y"])) {
  $year = htmlspecialchars($_GET["y"]);
} else {
  $year = $this_year;  //$first_invoice_year ;
}

$inyear=Array();
for($i=$this_year;$i>=$first_invoice_year;$i--) {
  if($i==$year) { $inyear[$i]=true; } else { $inyear[$i]=false; }
}

	$out["one"][$year]=Array(
      "cols"=>Array(),
      "rows"=>Array()
    );
  $out["one"][$year]["cols"]=Array(Array("label"=>$LANG["month"],"type"=>"string"),Array("label"=>$LANG["sales"],"type"=>"number"),Array("label"=>$LANG["expenses"],"type"=>"number"));
	
	$month = 01;
	$months = Array("01"=>$LANG["January"], "02"=>$LANG["February"], "03"=>$LANG["March"], "04"=>$LANG["April"], "05"=>$LANG["May"], "06"=>$LANG["Juny"], "07"=>$LANG["July"], "08"=>$LANG["August"], "09"=>$LANG["September"], "10"=>$LANG["October"], "11"=>$LANG["November"], "12"=>$LANG["December"]);

  while ($month <= 12)
	{
		//make month nice for mysql - accounts table doesnt like it if not 08 etc..
		if ( $month < 10 )
		{ 
			$month="0".$month;
		};
	  $add_to = Array();
		$add_to[] = Array("v"=>$month,"f"=>$months[$month]);
    
    /*
		* Sales
		*/
		$total_month_sales_sql = "select sum(ii.total) as month_total_sales from ".TB_PREFIX."invoice_items ii, ".TB_PREFIX."invoices i, ".TB_PREFIX."preferences p where i.id = ii.invoice_id AND i.preference_id = p.pref_id AND p.status = '1' AND i.date like '$year-$month%'";

		$total_month_sales = dbQuery($total_month_sales_sql) or die(htmlsafe(end($dbh->errorInfo())));
		$total_month_sales_array = $total_month_sales -> fetch();

    if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
		if ($total_month_sales_array['month_total_sales'] == "" ) {
			$add_to[] = Array("v"=>0,"f"=>money_format($format,0).$symb);
		} else {
      $add_to[] = Array("v"=>(int)$total_month_sales_array['month_total_sales'],"f"=>money_format($format,(int)$total_month_sales_array['month_total_sales']).$symb);
    }

		/*
		* Payment
		*/
		$total_month_payments_sql = " select sum(ac_amount) as month_total_payments from ".TB_PREFIX."payment where ac_date like '$year-$month%'";

		$total_month_payments = dbQuery($total_month_payments_sql) or die(htmlsafe(end($dbh->errorInfo())));
		$total_month_payments_array = $total_month_payments -> fetch();

		if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
    if ($total_month_payments_array['month_total_payments'] == "" ) {
			$add_to[] = Array("v"=>0,"f"=>money_format($format,0).$symb);
		} else {
      $add_to[] = Array("v"=>(int)$total_month_payments_array['month_total_payments'],"f"=>money_format($format,(int)$total_month_payments_array['month_total_payments']).$symb);
    }
		$month++;
    
    $out["one"][$year]["rows"][]["c"] = $add_to; 
	}
	
	$encoded = json_encode($out["one"][$year]);
	$smarty->assign('inyear', $inyear);
  $smarty->assign('results', Array($year=>$encoded));
	$smarty->assign('charttype', Array($year=>'BarChart'));
  
  /*
	* Sales Total
	*/
	$out["total"][$year]=Array(
      "cols"=>Array(),
      "rows"=>Array()
    );
  $out["total"][$year]["cols"]=Array(Array("label"=>"name","type"=>"string"),Array("label"=>"value","type"=>"number"));
  $add_tt = Array();
  
  $total_year_sales_sql = "select sum(ii.total) as year_total from ".TB_PREFIX."invoice_items ii, ".TB_PREFIX."invoices i, ".TB_PREFIX."preferences p  where i.id = ii.invoice_id AND i.preference_id = p.pref_id AND p.status = '1' AND i.date like '$year%'";

	$total_year_sales = dbQuery($total_year_sales_sql) or die(htmlsafe(end($dbh->errorInfo())));
	$total_year_sales_array = $total_year_sales -> fetch();

	if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
  if ($total_year_sales_array['year_total'] == "" ) {
			$add_tt[] = Array("c"=>Array(Array("v"=>$LANG["sales"]),Array("v"=>0,"f"=>money_format($format,0).$symb)));
		} else {
      $add_tt[] = Array("c"=>Array(Array("v"=>$LANG["sales"]),Array("v"=>(int)$total_year_sales_array['year_total'],"f"=>money_format($format,(int)$total_year_sales_array['year_total']).$symb)));
    }

	/*
	* Payment Total
	*/
	$total_year_payments_sql = " select sum(ac_amount) as year_total_payments from ".TB_PREFIX."payment where ac_date like '$year%'";
	
  $total_year_payments = dbQuery($total_year_payments_sql) or die(htmlsafe(end($dbh->errorInfo())));
	$total_year_payments_array = $total_year_payments -> fetch();

	if($GLOBALS["curr_sign"]!="") { $symb=" ".$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
  if ($total_year_payments_array['year_total_payments'] == "" ) {
			$add_tt[] = Array("c"=>Array(Array("v"=>$LANG["expenses"]),Array("v"=>0,"f"=>money_format($format,0).$symb)));
		} else {
      $add_tt[] = Array("c"=>Array(Array("v"=>$LANG["expenses"]),Array("v"=>(int)$total_year_payments_array['year_total_payments'],"f"=>money_format($format,(int)$total_year_payments_array['year_total_payments']).$symb)));
    }
    
  $out["total"][$year]["rows"] = $add_tt;
  $encoded_total = json_encode($out["total"][$year]);
  
  $smarty->assign('results_total', Array($year=>$encoded_total));
	$smarty->assign('charttype_total', Array($year=>'PieChart'));

$years[]=$year;
	
$smarty->assign('total_sales', $total_sales);
$smarty->assign('total_payments', $total_payments);
$years = array_reverse($years);
$smarty->assign('years', $years);

$smarty -> assign('pageActive', 'report');
$smarty -> assign('active_tab', '#home');
?>
