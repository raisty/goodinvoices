{if $preference.pref_id == 1 } {* Invoice template *}

<html>
<head>
<title>{$preference.pref_inv_heading|htmlsafe} {$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="{$css|urlsafe}style.css" media="all">
</head>
<body class="c27">
<table cellpadding="0" cellspacing="0" class="c2">
<tbody>
<tr><td class="c10">
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
          <tr class="c3"><td class="c19"><p class="c4"><span class="c15 c21">{$preference.pref_inv_heading|htmlsafe}</span></p>
            <p class="c0">{$preference.pref_inv_wording|htmlsafe}</p></td>
            <td class="c19"><p class="c5 c4"><span class="c21 c15">{$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</span>
            <img src="https://chart.googleapis.com/chart?chs=60x60&cht=qr&chl={$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}"  style="width: 60px; height: 60px; vertical-align: middle;" /></p></td></tr>
<!-- Biller section - start -->
          <tr class="c3"><td class="c19"><p class="c4"><span class="c15">{$biller.name|htmlsafe}</span></p><p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c28">
                  {if $biller.phone != null}<p class="c4"><span class="c0">{$LANG.phone_short}: {$biller.phone|htmlsafe}</span></p>{/if}
                  {if $biller.mobile_phone != null}<p class="c4"><span class="c0">{$LANG.mobile_short}: {$biller.mobile_phone|htmlsafe}</span></p>{/if}
                  {if $biller.email != null}<p class="c4"><span class="c0">{$biller.email|htmlsafe}</span></p>{/if}
                  {if $biller.street_address != null}<p class="c4"><span class="c0">{$biller.street_address|htmlsafe}</span></p>{/if}
                  {if $biller.zip_code != null && $biller.city != null}<p class="c4"><span class="c0">{if $biller.zip_code != null}{$biller.zip_code|htmlsafe}&nbsp;{/if}{if $biller.city != null}{$biller.city|htmlsafe}{/if}</span></p>{/if}
                  {if $biller.state != null}<p class="c4"><span class="c0">{$biller.state|htmlsafe}</span></p>{/if}
                  {if $biller.country != null }<p class="c4"><span class="c0">{$biller.country|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field1 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf1|htmlsafe}: {$biller.custom_field1|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field2 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf2|htmlsafe}: {$biller.custom_field2|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field3 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf3|htmlsafe}: {$biller.custom_field3|htmlsafe}</span></p>{/if}
                  <td class="c28"><p class="c5 c4"><img src="{$logo|urlsafe}" alt="" /></p>
                  </td></tr></tbody></table>
            <p class="c4 c8"><span></span></p>
            {if $biller.custom_field4 != null}
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c24"><p class="c4">
                  <span class="c0">{$customFieldLabels.biller_cf4|htmlsafe}: </span>
                  <span class="c15 c0 c0a">{$biller.custom_field4|htmlsafe}</span></p>
                  </td></tr></tbody></table>{/if}
            <p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c18"><p class="c9 c4"><span class="c1">{$LANG.date_of_creation}:</span></p>
                  <p class="c9 c4"><span class="c11">{$invoice.date}</span></p></td><td class="c18">
                    <p class="c9 c4"><span class="c1">{if $invoice.custom_field2 != null}{$customFieldLabels.invoice_cf2|htmlsafe}:{else}{$LANG.date_of_delivery}:{/if}</span></p>
                    <p class="c4 c9"><span class="c11">{if $invoice.custom_field2 != null}{php}$date=$this->_tpl_vars[invoice][custom_field2]; $indate=date_create($date); echo date_format($indate,"j.n.o");{/php}{else}{$invoice.date}{/if}</span></p></td>
                  <td class="c18"><p class="c9 c4"><span class="c1">{$LANG.date_of_maturity}:</span></p>
                  <p class="c9 c4"><span class="c11">{if $invoice.custom_field2 != null}
{php}
$plus=false;
$plus=$this->_tpl_vars["preference"]["pref_inv_payment_line2_value"];
if($plus) { $plus_add=$plus; } else { $plus_add="+2 week"; }
$date=$this->_tpl_vars["invoice"]["custom_field2"];
$indate=date_create($date);
$plusdays=date_format($indate,"U");
$final=strtotime($plus_add,$plusdays);
echo date("j.n.o",$final);
{/php}{else}{php}
$plus=false;
$plus=$this->_tpl_vars["preference"]["pref_inv_payment_line2_value"];
if($plus) { $plus_add=$plus; } else { $plus_add="+2 week"; }
$date=$this->_tpl_vars["invoice"]["date"];
$indate=date_create($date);
$plusdays=date_format($indate,"U");
$final=strtotime($plus_add,$plusdays);
echo date("j.n.o",$final);
{/php}{/if}</span></p></td></tr></tbody></table>
            </td>
<!-- Biller section - end -->
            <td class="c19">
            {if $invoice.custom_field1 != null}
              <p class="c5 c4 c23"><span class="c0">{$customFieldLabels.invoice_cf1|htmlsafe}: </span><span class="c0 c15">{$invoice.custom_field1|htmlsafe}</span></p>
            {/if}
              <p class="c4 c8"><span></span></p>
              <table cellpadding="0" cellspacing="0" class="c2a">
                <tbody><tr class="c3"><td class="c7a">
                  <p class="c4"><span class="c0">{$LANG.variable_symbol}:</span></p>
                  <p class="c5 c4 c23"><span class="c15 c0">
{"%02d"|sprintf:$preference.pref_id}{"%08d"|sprintf:$invoice.index_id|htmlsafe}
                  </span></p>
                  {if $preference.pref_inv_payment_line1_value != null}<p class="c4 c23"><span class="c1">{$LANG.constant_symbol} {$preference.pref_inv_payment_line1_value|htmlsafe}</span></p>{/if}
                  </td><td class="c7a">
                  <p class="c4"><span class="c0">{$LANG.type_of_payment}:</span></p>
                  <p class="c4"><span class="c15 c0">{$preference.pref_inv_payment_method|htmlsafe}</span></p>
                  {online_payment_link 
            				type=$preference.include_online_payment business=$biller.paypal_business_name 
            				item_name=$invoice.index_name invoice=$invoice.id 
            				amount=$invoice.total currency_code=$preference.currency_code
            				link_wording=$LANG.paypal_link
            				notify_url=$biller.paypal_notify_url return_url=$biller.paypal_return_url
            				domain_id = $invoice.domain_id include_image=true
            			}
                  </td></tr></tbody></table>
<!-- Customer section - start -->              
              <p class="c4 c8"><span></span></p>
              <p class="c4"><span class="c1">{$LANG.address}:</span></p><hr>
              {if $customer.name != null}<p class="c4 c8"><span class="c0"></span><span class="c0">{$customer.name|htmlsafe}</span></p>{/if}
              {if $customer.street_address2 != null}<p class="c4"><span class="c0">{$customer.street_address2|htmlsafe}</span></p>{elseif $customer.street_address != null}<p class="c4"><span class="c0">{$customer.street_address|htmlsafe}</span></p>{/if}
              {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c0">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
              {if $customer.state != null}<p class="c4"><span class="c0">{$customer.state|htmlsafe}</span></p>{/if}
              {if $customer.country != null }<p class="c4"><span class="c0">{$customer.country|htmlsafe}</span></p>{/if}
              <hr>
              <table cellpadding="0" cellspacing="0" class="c2a"><tbody><tr class="c3">
          <td class="c7">
          <p class="c4"><span class="c1">{$LANG.customer}:</span></p>
          {if $customer.custom_field1 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf1|htmlsafe}: {$customer.custom_field1|htmlsafe}</span></p>{/if}
          {if $customer.custom_field2 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf2|htmlsafe}: {$customer.custom_field2|htmlsafe}</span></p>{/if}
          {if $customer.custom_field3 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf3|htmlsafe}: {$customer.custom_field3|htmlsafe}</span></p>{/if}
          </td>
          <td class="c7">
          {if $customer.name != null}<p class="c4"><span class="c1">{$customer.name|htmlsafe}</span></p>{/if}
          {if $customer.street_address != null}<p class="c4"><span class="c1">{$customer.street_address|htmlsafe}</span></p>{/if}
          {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c1">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
          {if $customer.state != null}<p class="c4"><span class="c1">{$customer.state|htmlsafe}</span></p>{/if}
          {if $customer.country != null}<p class="c4"><span class="c1">{$customer.country|htmlsafe}</span></p>{/if}
          </td></tr></tbody></table>
          </td></tr></tbody></table>
<!-- Customer section - end -->
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody><tr class="c3"><td class="c16">
                
        <p class="c4 c8"><span>&nbsp;</span></p>
        <table cellpadding="0" cellspacing="0" class="c2a"><tbody>
        <tr class="c3"><td class="c22 c12">
        <p class="c4 c30"><span class="c1">{$LANG.item}</span></p>
        </td><td class="c17 c12">
        <p class="c4 c30"><span class="c1">{$LANG.quantity}</span></p>
        </td><td class="c6 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Unit_Cost}</span></p>
        </td><td class="c14 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Price}</span></p>
        </td></tr>
{foreach from=$invoiceItems item=invoiceItem}        
        <tr class="c3"><td class="c22">
        <p class="c4"><span class="c0">{$invoiceItem.product.description|htmlsafe}</span></p>
        {if $invoiceItem.description != null}<p class="c4"><span class="c1">{$LANG.description}: {$invoiceItem.description|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field1 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf1}: {$invoiceItem.product.custom_field1|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field2 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf2}: {$invoiceItem.product.custom_field2|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field3 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf3}: {$invoiceItem.product.custom_field3|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field4 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf4}: {$invoiceItem.product.custom_field4|htmlsafe}</span></p>{/if}
        </td><td class="c17">
        <p class="c5 c4"><span class="c0">{$invoiceItem.quantity|siLocal_number_trim}</span></p>
        </td><td class="c6">
        <p class="c5 c4"><span class="c0">{$invoiceItem.unit_price|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td><td class="c14">
        <p class="c4 c5"><span class="c0">{$invoiceItem.gross_total|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td></tr>
{/foreach}
{section name=line start=0 loop=$invoice.tax_grouped step=1}
{if ($invoice.tax_grouped[line].tax_amount != "0") }
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_name|htmlsafe}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_amount|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
{/section}

{if $invoice_number_of_taxes > 1}
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$LANG.tax_total}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total_tax|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
        <tr class="c3"><td colspan="3" class="c12 c22a">
        <p class="c5 c4"><span class="c0">{$LANG.sub_total}:</span></p>
        </td><td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody>
        </table>
        <p class="c4 c8"><span>&nbsp;</span></p>
        {if $invoice.note != ""}<p class="c4"><span class="c8"><u>{$LANG.note}</u>: {$invoice.note}</span></p>{/if}
                
        </td></tr>
        </tbody></table>
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
        <tr class="c3"><td class="c13"><p class="c4"><span class="c1">{$LANG.who_create}:</span></p>
        <p class="c4"><span class="c1">({$smarty.session.Zend_Auth.email|htmlsafe})</span></p>
        <p class="c4 c8"><span class="c1">
        {if $po_logo!=""}<img src="{$po_logo}" alt="" />{/if}
        </span></p>
        </td>
        <td class="c13"><p class="c4"><span class="c1">{$LANG.who_take}:</span></p></td>
        <td class="c13"><p class="c4"><span class="c1">{$LANG.total}: {$invoice.total|siLocal_number} {$preference.pref_currency_sign} ({$preference.currency_code})</span></p>
        <p class="c4"><span class="c1">{$LANG.paid}: {$invoice.paid|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4 c8"><span class="c1"></span><span class="c0">{$LANG.owing}:</span></p>
        <p class="c5 c4"><span class="c25">{$invoice.owing|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4"><span class="c1">={num_to_text number=$invoice.owing zero=true lang=$country}= {get_cents number=$invoice.owing} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody></table>
{if $preference.pref_inv_detail_line!= null}
<table cellpadding="0" cellspacing="0" class="c2a">
<tbody>
<tr><td class="c24">
<p class="c4 c8"><span class="c0">
<u>{$preference.pref_inv_detail_heading|htmlsafe}</u>: {$preference.pref_inv_detail_line|outhtml}
</span></p>
</td></tr>
</tbody>
</table>
{/if}
</div>
{if $biller.footer != ""}
<div align="center" style="border: 1px #000 solid;">
{$biller.footer|outhtml}
</div>
{/if}
</td></tr>
</tbody></table>
</body></html>

{elseif $preference.pref_id == 2 } {* Cash form template *}

<html><head><title>{$preference.pref_inv_heading|htmlsafe} {$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="{$css|urlsafe}style_pd.css" media="all">
</head>
<body class="c5 c18">
<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr><td class="c15">
<table cellpadding="0" cellspacing="0" class="c12"><tbody>
<tr><td class="c2"><p class="c3"><span>{$biller.name|htmlsafe}</span></p>
<p class="c3"><span class="c4">{$biller.street_address|htmlsafe}</span></p>
<p class="c3"><span class="c4">{if $biller.zip_code != null}{$biller.zip_code|htmlsafe}&nbsp;{/if}{if $biller.city != null}{$biller.city|htmlsafe}{/if}</span></p>
<p class="c3"><span class="c4">{$biller.state|htmlsafe}</span></p>
 <hr>
{if $biller.custom_field1 != null}<p class="c3"><span class="c4">{$customFieldLabels.biller_cf1|htmlsafe}: {$biller.custom_field1|htmlsafe}</span></p>{/if}
{if $biller.custom_field2 != null}<p class="c3"><span class="c4">{$customFieldLabels.biller_cf2|htmlsafe}: {$biller.custom_field2|htmlsafe}</span></p>{/if}
{if $biller.custom_field3 != null}<p class="c3"><span class="c4">{$customFieldLabels.biller_cf3|htmlsafe}: {$biller.custom_field3|htmlsafe}</span></p>{/if}
</td>
<td class="c2">
<p class="c3" style="text-align: right;">
<span class="c14" style="font-size: 22px;">{$preference.pref_inv_heading|htmlsafe}</span>
<span><img src="https://chart.googleapis.com/chart?chs=60x60&cht=qr&chl={$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}" style="width: 60px; height: 60px; vertical-align: middle;" /></span>
</p>
<p class="c3"><span>{$LANG.document_nomb}: {$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</span></p>
<p class="c3 c17"><span></span></p>
<p class="c3"><span class="c4">{$LANG.date_of_creation}: {$invoice.date}</span></p>
<p class="c3"><span class="c4">{$LANG.date_of_print}: {$smarty.now|date_format:"%D"}</span></p>
</td></tr></tbody></table>
<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr>
<td class="c8"><p class="c3"><span class="c13">
{$LANG.from_payer}:
{if $customer.name != null}{$customer.name|htmlsafe},&nbsp;{/if}{if $customer.street_address != null}{$customer.street_address|htmlsafe},&nbsp;{/if}{if $customer.zip_code != null}{$customer.zip_code|htmlsafe},&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe},&nbsp;{/if}{if $customer.state != null}{$customer.state|htmlsafe}{/if}
</span></p>
<p class="c3"><span class="c13">
{if $customer.custom_field1 != null}{$customFieldLabels.customer_cf1|htmlsafe}: {$customer.custom_field1|htmlsafe};&nbsp;{/if}
{if $customer.custom_field2 != null}{$customFieldLabels.customer_cf2|htmlsafe}: {$customer.custom_field2|htmlsafe};&nbsp;{/if}
{if $customer.custom_field3 != null}{$customFieldLabels.customer_cf3|htmlsafe}: {$customer.custom_field3|htmlsafe}{/if}
</span></p></td></tr></tbody></table>

<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr>
<td class="c11"><p class="c3 c6"><span class="c4">{$LANG.isum_netto}</span></p></td>
<td class="c11"><p class="c3 c6"><span class="c4">{$LANG.isum_vat}</span></p></td>
<td class="c0 c20"><p class="c3 c6"><span class="c4">{$LANG.isum_brutto}</span></p></td>
<td class="c7 c20"><p class="c3 c6"><span class="c4">{$LANG.isum_curren}</span></p></td></tr>

<tr>
<td class="c21"><p class="c3 c6"><span class="c4" style="font-size: 14px;">{$invoice.gross|siLocal_number}</span></p></td>
<td class="c21"><p class="c3 c6">
<span class="c4" style="font-size: 14px;">{if $invoice.total_tax > 0}{$invoice.total_tax|siLocal_number}{else}{"0.00"|siLocal_number}{/if}</span>
</p></td>
<td class="c0"><p class="c3 c6"><span class="c4 c16" style="font-size: 14px;">{$invoice.total|siLocal_number}</span></p></td>
<td class="c7"><p class="c3 c6"><span class="c4 c5 c16" style="font-size: 14px;">{$preference.pref_currency_sign}</span></p></td>
</tr>
</tbody></table>

<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr><td class="c8"><p class="c3"><span class="c4">{$LANG.isum_wording}: ={num_to_text number=$invoice.total zero=true lang=$country}= {get_cents number=$invoice.total} {$preference.pref_currency_sign}</span></p>
{if $preference.pref_inv_detail_line!= null} 
<hr><p class="c3"><span class="c4">{$preference.pref_inv_detail_heading|htmlsafe}: {$preference.pref_inv_detail_line|outhtml}</span></p>
{/if}
</td></tr></tbody></table>

<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr><td class="c2">
<p class="c3 c10"><span class="c4">{$LANG.isum_teller}</span></p>
<p class="c3 c10"><span class="c19">({$smarty.session.Zend_Auth.email|htmlsafe})</span></p>
{if $logo != null}
<p class="c3 c9"><span>
{if $po_logo!=""}<img src="{$po_logo}" alt="" />{/if}
</span></p>
<p class="c3 c9"><span></span></p>
<p class="c3 c9"><span></span></p>
<p class="c3 c17"><span></span></p>
{else}
<p class="c3 c9"><span></span></p>
<p class="c3 c9"><span></span></p>
<p class="c3 c9"><span></span></p>
<p class="c3 c17"><span></span></p>
{/if}
</td>
<td class="c2">
<p class="c3 c10"><span class="c4">{$LANG.isum_recip}</span></p>
</td></tr></tbody></table>
</td></tr></tbody></table>
</body></html>

{elseif $preference.pref_id == 3 } {* Qoute template *}

<html><head>
<title>{$preference.pref_inv_heading|htmlsafe} {$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="{$css|urlsafe}style.css" media="all">
</head>
<body class="c27">
<table cellpadding="0" cellspacing="0" class="c2">
<tbody>
<tr><td class="c10">
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
          <tr class="c3"><td class="c19"><p class="c4"><span class="c15 c21">{$preference.pref_inv_heading|htmlsafe}</span></p>
            <p class="c0">{$preference.pref_inv_wording|htmlsafe}</p></td>
            <td class="c19"><p class="c5 c4"><span class="c21 c15">{$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</span>
            <img src="https://chart.googleapis.com/chart?chs=60x60&cht=qr&chl={$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}" style="width: 60px; height: 60px; vertical-align: middle;" /></p></td></tr>
<!-- Biller section - start -->
          <tr class="c3"><td class="c19"><p class="c4"><span class="c15">{$biller.name|htmlsafe}</span></p><p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c28">
                  {if $biller.phone != null}<p class="c4"><span class="c0">{$LANG.phone_short}: {$biller.phone|htmlsafe}</span></p>{/if}
                  {if $biller.mobile_phone != null}<p class="c4"><span class="c0">{$LANG.mobile_short}: {$biller.mobile_phone|htmlsafe}</span></p>{/if}
                  {if $biller.email != null}<p class="c4"><span class="c0">{$biller.email|htmlsafe}</span></p>{/if}
                  {if $biller.street_address != null}<p class="c4"><span class="c0">{$biller.street_address|htmlsafe}</span></p>{/if}
                  {if $biller.zip_code != null && $biller.city != null}<p class="c4"><span class="c0">{if $biller.zip_code != null}{$biller.zip_code|htmlsafe}&nbsp;{/if}{if $biller.city != null}{$biller.city|htmlsafe}{/if}</span></p>{/if}
                  {if $biller.state != null}<p class="c4"><span class="c0">{$biller.state|htmlsafe}</span></p>{/if}
                  {if $biller.country != null }<p class="c4"><span class="c0">{$biller.country|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field1 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf1|htmlsafe}: {$biller.custom_field1|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field2 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf2|htmlsafe}: {$biller.custom_field2|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field3 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf3|htmlsafe}: {$biller.custom_field3|htmlsafe}</span></p>{/if}
                  <td class="c28"><p class="c5 c4"><img src="{$logo|urlsafe}" alt="" /></p>
                  </td></tr></tbody></table>
            <p class="c4 c8"><span></span></p>
            {if $biller.custom_field4 != null}
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c24"><p class="c4">
                  <span class="c0">{$customFieldLabels.biller_cf4|htmlsafe}: </span>
                  <span class="c15 c0 c0a">{$biller.custom_field4|htmlsafe}</span></p>
                  </td></tr></tbody></table>{/if}
            <p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c18"><p class="c9 c4"><span class="c1">{$LANG.date_of_creation}:</span></p>
                  <p class="c9 c4"><span class="c11">{$invoice.date}</span></p></td>
                </tr></tbody></table>
            </td>
<!-- Biller section - end -->
            <td class="c19">
            {if $invoice.custom_field1 != null}
              <p class="c5 c4 c23"><span class="c0">{$customFieldLabels.invoice_cf1|htmlsafe}: </span><span class="c0 c15">{$invoice.custom_field1|htmlsafe}</span></p>
            {/if}
              <p class="c4 c8"><span></span></p>
              <table cellpadding="0" cellspacing="0" class="c2a">
                <tbody><tr class="c3"><td class="c7a">
                  <p class="c4"><span class="c0">{$LANG.variable_symbol}:</span></p>
                  <p class="c5 c4 c23"><span class="c15 c0">
{"%02d"|sprintf:$preference.pref_id}{"%08d"|sprintf:$invoice.index_id|htmlsafe}                
                  </span></p>
                  {if $preference.pref_inv_payment_line1_value != null}<p class="c4 c23"><span class="c1">{$LANG.constant_symbol} {$preference.pref_inv_payment_line1_value|htmlsafe}</span></p>{/if}
                  </td><td class="c7a">
                  <p class="c4"><span class="c0">{$LANG.type_of_payment}:</span></p>
                  <p class="c4"><span class="c15 c0">{$preference.pref_inv_payment_method|htmlsafe}</span></p>
                  {online_payment_link 
            				type=$preference.include_online_payment business=$biller.paypal_business_name 
            				item_name=$invoice.index_name invoice=$invoice.id 
            				amount=$invoice.total currency_code=$preference.currency_code
            				link_wording=$LANG.paypal_link
            				notify_url=$biller.paypal_notify_url return_url=$biller.paypal_return_url
            				domain_id = $invoice.domain_id include_image=true
            			}
                  </td></tr></tbody></table>
<!-- Customer section - start -->              
              <p class="c4 c8"><span></span></p>
              <p class="c4"><span class="c1">{$LANG.address}:</span></p><hr>
              {if $customer.name != null}<p class="c4 c8"><span class="c0"></span><span class="c0">{$customer.name|htmlsafe}</span></p>{/if}
              {if $customer.street_address2 != null}<p class="c4"><span class="c0">{$customer.street_address2|htmlsafe}</span></p>{elseif $customer.street_address != null}<p class="c4"><span class="c0">{$customer.street_address|htmlsafe}</span></p>{/if}
              {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c0">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
              {if $customer.state != null}<p class="c4"><span class="c0">{$customer.state|htmlsafe}</span></p>{/if}
              {if $customer.country != null }<p class="c4"><span class="c0">{$customer.country|htmlsafe}</span></p>{/if}
              <hr>
              <table cellpadding="0" cellspacing="0" class="c2a"><tbody><tr class="c3">
          <td class="c7">
          <p class="c4"><span class="c1">{$LANG.customer}:</span></p>
          {if $customer.custom_field1 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf1|htmlsafe}: {$customer.custom_field1|htmlsafe}</span></p>{/if}
          {if $customer.custom_field2 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf2|htmlsafe}: {$customer.custom_field2|htmlsafe}</span></p>{/if}
          {if $customer.custom_field3 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf3|htmlsafe}: {$customer.custom_field3|htmlsafe}</span></p>{/if}
          </td>
          <td class="c7">
          {if $customer.name != null}<p class="c4"><span class="c1">{$customer.name|htmlsafe}</span></p>{/if}
          {if $customer.street_address != null}<p class="c4"><span class="c1">{$customer.street_address|htmlsafe}</span></p>{/if}
          {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c1">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
          {if $customer.state != null}<p class="c4"><span class="c1">{$customer.state|htmlsafe}</span></p>{/if}
          {if $customer.country != null}<p class="c4"><span class="c1">{$customer.country|htmlsafe}</span></p>{/if}
          </td></tr></tbody></table>
          </td></tr></tbody></table>
<!-- Customer section - end -->
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody><tr class="c3"><td class="c16">
                
        <p class="c4 c8"><span>&nbsp;</span></p>
        <table cellpadding="0" cellspacing="0" class="c2a"><tbody>
        <tr class="c3"><td class="c22 c12">
        <p class="c4 c30"><span class="c1">{$LANG.item}</span></p>
        </td><td class="c17 c12">
        <p class="c4 c30"><span class="c1">{$LANG.quantity}</span></p>
        </td><td class="c6 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Unit_Cost}</span></p>
        </td><td class="c14 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Price}</span></p>
        </td></tr>
{foreach from=$invoiceItems item=invoiceItem}        
        <tr class="c3"><td class="c22">
        <p class="c4"><span class="c0">{$invoiceItem.product.description|htmlsafe}</span></p>
        {if $invoiceItem.description != null}<p class="c4"><span class="c1">{$LANG.description}: {$invoiceItem.description|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field1 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf1}: {$invoiceItem.product.custom_field1|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field2 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf2}: {$invoiceItem.product.custom_field2|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field3 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf3}: {$invoiceItem.product.custom_field3|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field4 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf4}: {$invoiceItem.product.custom_field4|htmlsafe}</span></p>{/if}
        </td><td class="c17">
        <p class="c5 c4"><span class="c0">{$invoiceItem.quantity|siLocal_number_trim}</span></p>
        </td><td class="c6">
        <p class="c5 c4"><span class="c0">{$invoiceItem.unit_price|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td><td class="c14">
        <p class="c4 c5"><span class="c0">{$invoiceItem.gross_total|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td></tr>
{/foreach}
{section name=line start=0 loop=$invoice.tax_grouped step=1}
{if ($invoice.tax_grouped[line].tax_amount != "0") }
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_name|htmlsafe}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_amount|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
{/section}

{if $invoice_number_of_taxes > 1}
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$LANG.tax_total}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total_tax|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
        <tr class="c3"><td colspan="3" class="c12 c22a">
        <p class="c5 c4"><span class="c0">{$LANG.sub_total}:</span></p>
        </td><td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody>
        </table>
        <p class="c4 c8"><span>&nbsp;</span></p>
        {if $invoice.note != ""}<p class="c4"><span class="c8"><u>{$LANG.note}</u>: {$invoice.note}</span></p>{/if}
                
        </td></tr>
        </tbody></table>
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
        <tr class="c3"><td class="c13"><p class="c4"><span class="c1">{$LANG.who_create}:</span></p>
        <p class="c4"><span class="c1">({$smarty.session.Zend_Auth.email|htmlsafe})</span></p>
        <p class="c4 c8"><span class="c1">
        {if $po_logo!=""}<img src="{$po_logo}" alt="" />{/if}
        </span></p>
        </td>
        <td class="c13"><p class="c4"><span class="c1">{$LANG.total}: {$invoice.total|siLocal_number} {$preference.pref_currency_sign} ({$preference.currency_code})</span></p>
        <p class="c4"><span class="c1">{$LANG.paid}: {$invoice.paid|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4 c8"><span class="c1"></span><span class="c0">{$LANG.owing}:</span></p>
        <p class="c5 c4"><span class="c25">{$invoice.owing|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4"><span class="c1">={num_to_text number=$invoice.owing zero=true lang=$country}= {get_cents number=$invoice.owing} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody></table>
{if $preference.pref_inv_detail_line!= null}
<table cellpadding="0" cellspacing="0" class="c2a">
<tbody>
<tr><td class="c24">
<p class="c4 c8"><span class="c0">
<u>{$preference.pref_inv_detail_heading|htmlsafe}</u>: {$preference.pref_inv_detail_line|outhtml}
</span></p>
</td></tr>
</tbody>
</table>
{/if}
</div>
{if $biller.footer != ""}
<div align="center" style="border: 1px #000 solid;">
{$biller.footer|outhtml}
</div>
{/if}
</td></tr>
</tbody></table>
</body></html>

{elseif $preference.pref_id == 4 } {* Delivery list template *}

<html><head>
<title>{$preference.pref_inv_heading|htmlsafe} {$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="{$css|urlsafe}style_dl.css" media="all">
</head>
<body class="c27">
<table cellpadding="0" cellspacing="0" class="c2">
<tbody>
<tr><td class="c10">
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
          <tr class="c3"><td class="c19"><p class="c4"><span class="c15 c21">{$preference.pref_inv_heading|htmlsafe}</span></p>
            <p class="c0">{$preference.pref_inv_wording|htmlsafe}</p></td>
            <td class="c19"><p class="c5 c4"><span class="c21 c15">{$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}</span>
            <img src="https://chart.googleapis.com/chart?chs=60x60&cht=qr&chl={$preference.pref_id|htmlsafe}-{$invoice.index_id|htmlsafe}"  style="width: 60px; height: 60px; vertical-align: middle;" /></p></td></tr>
<!-- Biller section - start -->
          <tr class="c3"><td class="c19">
            <p class="c4"><span class="c1">{$LANG.supplier}:</span></p>
            <p class="c4"><span class="c15">{$biller.name|htmlsafe}</span></p><p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c28">
                  {if $biller.phone != null}<p class="c4"><span class="c0">{$LANG.phone_short}: {$biller.phone|htmlsafe}</span></p>{/if}
                  {if $biller.mobile_phone != null}<p class="c4"><span class="c0">{$LANG.mobile_short}: {$biller.mobile_phone|htmlsafe}</span></p>{/if}
                  {if $biller.email != null}<p class="c4"><span class="c0">{$biller.email|htmlsafe}</span></p>{/if}
                  {if $biller.street_address != null}<p class="c4"><span class="c0">{$biller.street_address|htmlsafe}</span></p>{/if}
                  {if $biller.zip_code != null && $biller.city != null}<p class="c4"><span class="c0">{if $biller.zip_code != null}{$biller.zip_code|htmlsafe}&nbsp;{/if}{if $biller.city != null}{$biller.city|htmlsafe}{/if}</span></p>{/if}
                  {if $biller.state != null}<p class="c4"><span class="c0">{$biller.state|htmlsafe}</span></p>{/if}
                  {if $biller.country != null }<p class="c4"><span class="c0">{$biller.country|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field1 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf1|htmlsafe}: {$biller.custom_field1|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field2 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf2|htmlsafe}: {$biller.custom_field2|htmlsafe}</span></p>{/if}
                  {if $biller.custom_field3 != null}<p class="c4"><span class="c0">{$customFieldLabels.biller_cf3|htmlsafe}: {$biller.custom_field3|htmlsafe}</span></p>{/if}
                  <td class="c28"><p class="c5 c4"><img src="{$logo|urlsafe}" alt="" /></p>
                  </td></tr></tbody></table>
            <p class="c4 c8"><span></span></p>
            <table cellpadding="0" cellspacing="0" class="c2a">
              <tbody>
                <tr class="c3"><td class="c18"><p class="c9 c4"><span class="c1">{$LANG.date_of_creation}:</span></p>
                  <p class="c9 c4"><span class="c11">{$invoice.date}</span></p></td></tr></tbody></table>
            </td>
<!-- Biller section - end -->
            <td class="c19">
            {if $invoice.custom_field1 != null}
              <p class="c5 c4 c23"><span class="c0">{$customFieldLabels.invoice_cf1|htmlsafe}: </span><span class="c0 c15">{$invoice.custom_field1|htmlsafe}</span></p>
            {/if}
<!-- Customer section - start -->              
              <p class="c4 c8"><span></span></p>
              <p class="c4"><span class="c1">{$LANG.address}:</span></p><hr>
              {if $customer.name != null}<p class="c4 c8"><span class="c0"></span><span class="c0">{$customer.name|htmlsafe}</span></p>{/if}
              {if $customer.street_address2 != null}<p class="c4"><span class="c0">{$customer.street_address2|htmlsafe}</span></p>{elseif $customer.street_address != null}<p class="c4"><span class="c0">{$customer.street_address|htmlsafe}</span></p>{/if}
              {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c0">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
              {if $customer.state != null}<p class="c4"><span class="c0">{$customer.state|htmlsafe}</span></p>{/if}
              {if $customer.country != null }<p class="c4"><span class="c0">{$customer.country|htmlsafe}</span></p>{/if}
              <hr>
              <table cellpadding="0" cellspacing="0" class="c2a"><tbody><tr class="c3">
          <td class="c7">
          <p class="c4"><span class="c1">{$LANG.customer}:</span></p>
          {if $customer.custom_field1 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf1|htmlsafe}: {$customer.custom_field1|htmlsafe}</span></p>{/if}
          {if $customer.custom_field2 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf2|htmlsafe}: {$customer.custom_field2|htmlsafe}</span></p>{/if}
          {if $customer.custom_field3 != null}<p class="c4"><span class="c1">{$customFieldLabels.customer_cf3|htmlsafe}: {$customer.custom_field3|htmlsafe}</span></p>{/if}
          </td>
          <td class="c7">
          {if $customer.name != null}<p class="c4"><span class="c1">{$customer.name|htmlsafe}</span></p>{/if}
          {if $customer.street_address != null}<p class="c4"><span class="c1">{$customer.street_address|htmlsafe}</span></p>{/if}
          {if $customer.zip_code != null && $customer.city != null}<p class="c4"><span class="c1">{if $customer.zip_code != null}{$customer.zip_code|htmlsafe}&nbsp;{/if}{if $customer.city != null}{$customer.city|htmlsafe}{/if}</span></p>{/if}
          {if $customer.state != null}<p class="c4"><span class="c1">{$customer.state|htmlsafe}</span></p>{/if}
          {if $customer.country != null}<p class="c4"><span class="c1">{$customer.country|htmlsafe}</span></p>{/if}
          </td></tr></tbody></table>
          </td></tr></tbody></table>
<!-- Customer section - end -->
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody><tr class="c3"><td class="c16">
                
        <p class="c4 c8"><span>&nbsp;</span></p>
        <table cellpadding="0" cellspacing="0" class="c2a"><tbody>
        <tr class="c3"><td class="c22 c12">
        <p class="c4 c30"><span class="c1">{$LANG.item}</span></p>
        </td><td class="c17 c12">
        <p class="c4 c30"><span class="c1">{$LANG.quantity}</span></p>
        </td><td class="c6 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Unit_Cost}</span></p>
        </td><td class="c14 c12">
        <p class="c4 c30"><span class="c1">{$LANG.Price}</span></p>
        </td></tr>
{foreach from=$invoiceItems item=invoiceItem}        
        <tr class="c3"><td class="c22">
        <p class="c4"><span class="c0">{$invoiceItem.product.description|htmlsafe}</span></p>
        {if $invoiceItem.description != null}<p class="c4"><span class="c1">{$LANG.description}: {$invoiceItem.description|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field1 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf1}: {$invoiceItem.product.custom_field1|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field2 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf2}: {$invoiceItem.product.custom_field2|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field3 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf3}: {$invoiceItem.product.custom_field3|htmlsafe}</span></p>{/if}
        {if $invoiceItem.product.custom_field4 != null}<p class="c4"><span class="c1 c29">{$customFieldLabels.product_cf4}: {$invoiceItem.product.custom_field4|htmlsafe}</span></p>{/if}
        </td><td class="c17">
        <p class="c5 c4"><span class="c0">{$invoiceItem.quantity|siLocal_number_trim}</span></p>
        </td><td class="c6">
        <p class="c5 c4"><span class="c0">{$invoiceItem.unit_price|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td><td class="c14">
        <p class="c4 c5"><span class="c0">{$invoiceItem.gross_total|siLocal_number} {$preference.pref_currency_sign|htmlsafe}</span></p>
        </td></tr>
{/foreach}
{section name=line start=0 loop=$invoice.tax_grouped step=1}
{if ($invoice.tax_grouped[line].tax_amount != "0") }
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_name|htmlsafe}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.tax_grouped[line].tax_amount|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
{/section}

{if $invoice_number_of_taxes > 1}
        <tr class="c3"><td colspan="3" class="c12 c22">
        <p class="c5 c4"><span class="c0">{$LANG.tax_total}:</span></p>
        </td>
        <td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total_tax|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
{/if}
        <tr class="c3"><td colspan="3" class="c12 c22a">
        <p class="c5 c4"><span class="c0">{$LANG.sub_total}:</span></p>
        </td><td class="c14 c12">
        <p class="c5 c4"><span class="c0">{$invoice.total|siLocal_number} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody>
        </table>
        <p class="c4 c8"><span>&nbsp;</span></p>
        {if $invoice.note != ""}<p class="c4"><span class="c8"><u>{$LANG.note}</u>: {$invoice.note}</span></p>{/if}
                
        </td></tr>
        </tbody></table>
    </div>
    <div align="center">
      <table cellpadding="0" cellspacing="0" class="c2a">
        <tbody>
        <tr class="c3"><td class="c13"><p class="c4"><span class="c1">{$LANG.who_create}:</span></p>
        <p class="c4"><span class="c1">({$smarty.session.Zend_Auth.email|htmlsafe})</span></p>
        <p class="c4 c8"><span class="c1">
        {if $po_logo!=""}<img src="{$po_logo}" alt="" />{/if}
        </span></p>
        </td>
        <td class="c13"><p class="c4"><span class="c1">{$LANG.who_take}:</span></p></td>
        <td class="c13"><p class="c4"><span class="c1">{$LANG.total}: {$invoice.total|siLocal_number} {$preference.pref_currency_sign} ({$preference.currency_code})</span></p>
        <p class="c4"><span class="c1">{$LANG.paid}: {$invoice.paid|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4 c8"><span class="c1"></span><span class="c0">{$LANG.owing}:</span></p>
        <p class="c5 c4"><span class="c25">{$invoice.owing|siLocal_number} {$preference.pref_currency_sign}</span></p><hr>
        <p class="c4"><span class="c1">={num_to_text number=$invoice.owing zero=true lang=$country}= {get_cents number=$invoice.owing} {$preference.pref_currency_sign}</span></p>
        </td></tr>
        </tbody></table>
{if $preference.pref_inv_detail_line!= null}
<table cellpadding="0" cellspacing="0" class="c2a">
<tbody>
<tr><td class="c24">
<p class="c4 c8"><span class="c0">
<u>{$preference.pref_inv_detail_heading|htmlsafe}</u>: {$preference.pref_inv_detail_line|outhtml}
</span></p>
</td></tr>
</tbody>
</table>
{/if}
</div>
{if $biller.footer != ""}
<div align="center" style="border: 1px #000 solid;">
{$biller.footer|outhtml}
</div>
{/if}
</td></tr>
</tbody></table>
</body></html>

{/if}