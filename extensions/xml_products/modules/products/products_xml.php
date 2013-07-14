<?php
header("Content-Type: text/xml, charset=utf-8");

$domain = $auth_session->domain_id;
$products = new product();
$all_products = $products->get_enabled();

$xml = new SimpleXMLElement('<products/>');

foreach ($all_products as $product) {
    $prod = $xml->addChild('product');
    $prod->addChild('name',$product["description"]);
    $prod->addChild('price',(int)$product["unit_price"]);
    
    if($GLOBALS["curr_sign"]!="") { $symb=$GLOBALS["curr_sign"]; $format="%!n"; } else { $symb=""; $format="%n"; }
    $prod->addChild('price_formated',money_format($format,(int)$product["unit_price"]));
    $prod->addChild('currency',$symb);
    
    $vatSQL="SELECT tax_description,tax_percentage,type FROM ".TB_PREFIX."tax WHERE tax_id = ".$product["default_tax_id"]." AND tax_enabled = 1 AND domain_id = ".$domain.";";
    $vat_sql = dbQuery($vatSQL);
    $vat_item = $vat_sql->fetch(PDO::FETCH_ASSOC);

    $vat = $prod->addChild('vat');
    $vat->addChild('name',$vat_item["tax_description"]);
    $vat->addChild('value',(int)$vat_item["tax_percentage"]);
    $vat->addChild('type',$vat_item["type"]);
    
    $prod->addChild('cf1',$product["custom_field1"]);
    $prod->addChild('cf2',$product["custom_field2"]);
    $prod->addChild('cf3',$product["custom_field3"]);
    $prod->addChild('cf4',$product["custom_field4"]);
    $prod->addChild('notes',$product["notes"]);
    
    
}

print($xml->asXML());
?>