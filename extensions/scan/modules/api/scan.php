<?php
$APIpassword="12345";

$flush=Array();
$id=htmlspecialchars(addslashes(urldecode($_GET["code"])));
$pass=urldecode($_GET["pass"]);

if(isset($pass) && ($APIpassword!="") && ($APIpassword==$pass) && isset($id)) {
  $id_divided = explode("-",$id);
  
  $inv_type = (int)$id_divided[0];
  if($length=strlen($id_divided[1])>6) {
    $author_id = substr($id_divided[1], 0, -6);
    $author_id = (int)$author_id;
    $form_id = substr($id_divided[1], -6, 6);
    $form_id = (int)$form_id;
    $index_id = (int)$id_divided[1];
  } else {
    $author_id = null;
    $index_id = (int)$id_divided[1];
  }
  
  if($inv_type==99) //its payment form
  {
    $payment = getPayment($index_id);
    $invoice = getInvoice($payment['ac_inv_id']);
    $type=$LANG["paymentproc_name"];
  } else { //other forms
    $invoice = getInvoiceByIndex($index_id);  
    $type_from=getPreference($invoice['preference_id']);
    $type=$type_from["pref_description"];
  }
  
  $customer = getCustomer($invoice['customer_id']);
  $biller = getBiller($invoice['biller_id']);
  $customFieldLabels = getCustomFieldLabels();
  
  $gross=(int)$invoice['gross'];
  $paid=(int)$invoice['paid'];
  $owing=(int)$invoice['owing'];

  $flush=Array(
    1=>$gross,
    2=>$paid,
    3=>$owing,
    $LANG['invoice_type']=>$type,
    $LANG['date_upper']=>$invoice['calc_date'],
    $LANG['biller']=>$biller['name'],
    $LANG['customer']=>$customer['name'],
    $LANG['street']=>$customer['street_address'],
    $LANG['city']=>$customer['city'],
    $LANG['zip']=>$customer['zip_code'],
    $LANG['state']=>$customer['state'],
    $customFieldLabels["customer_cf1"]=>$customer['custom_field1'],
    $customFieldLabels["customer_cf2"]=>$customer['custom_field2'],
    $customFieldLabels["customer_cf3"]=>$customer['custom_field3'],
    $customFieldLabels["customer_cf4"]=>$customer['custom_field4'],
    $customFieldLabels["invoice_cf1"]=>$invoice['custom_field1'],
    $customFieldLabels["invoice_cf2"]=>$invoice['custom_field2'],
    $customFieldLabels["invoice_cf3"]=>$invoice['custom_field3'],
    $customFieldLabels["invoice_cf4"]=>$invoice['custom_field4'],
    4=>$customer['phone'],
    5=>$customer['email'],
    $LANG['phone']=>$customer['phone'],
    $LANG['email']=>$customer['email']
  );               

  header('Content-type: application/json');
  echo json_encode($flush);
                             
} else {
  header('HTTP/1.1 403 Forbidden');
  exit;
} 

?>

