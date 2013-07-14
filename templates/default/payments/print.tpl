<html><head><title>{$LANG.number_short|htmlsafe}: {$invoice.id|htmlsafe}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="/templates/invoices/default/style_pd.css" media="all">
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
<span class="c14" style="font-size: 22px;">{$LANG.paymentproc_name}</span>
<span><img src="https://chart.googleapis.com/chart?chs=60x60&cht=qr&chl=99-{$biller.id|htmlsafe}{$payment.date|date_format:"%y"}{"%03d"|sprintf:$payment.id|htmlsafe}" style="width: 60px; height: 60px; vertical-align: middle;" /></span>
</p>
<p class="c3"><span>{$LANG.document_nomb}: 99-{$biller.id|htmlsafe}{$payment.date|date_format:"%y"}{"%03d"|sprintf:$payment.id|htmlsafe}</span></p>
<p class="c3 c17"><span></span></p>
<p class="c3"><span class="c4">{$LANG.date_of_creation}: {$payment.date|htmlsafe}</span></p>
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
<td class="c11"><p class="c3 c6"><span class="c4">{$LANG.payment_id}</span></p></td>
<td class="c11"><p class="c3 c6"><span class="c4">{$preference.pref_description|htmlsafe} {$LANG.id}</span></p></td>
<td class="c0 c20"><p class="c3 c6"><span class="c4">{$LANG.isum_brutto}</span></p></td>
<td class="c7 c20"><p class="c3 c6"><span class="c4">{$LANG.isum_curren}</span></p></td></tr>

<tr>
<td class="c21"><p class="c3 c6"><span class="c4" style="font-size: 14px;">{$payment.id|htmlsafe}</span></p></td>
<td class="c21"><p class="c3 c6">
<span class="c4" style="font-size: 14px;">{$invoice.index_id|htmlsafe}</span>
</p></td>
<td class="c0"><p class="c3 c6"><span class="c4 c16" style="font-size: 14px;">{$payment.ac_amount|siLocal_number}</span></p></td>
<td class="c7"><p class="c3 c6"><span class="c4 c5 c16" style="font-size: 14px;">{$preference.pref_currency_sign|htmlsafe}</span></p></td>
</tr>
</tbody></table>

<table cellpadding="0" cellspacing="0" class="c12"><tbody><tr><td class="c8"><p class="c3"><span class="c4">&nbsp;</span></p>
{if $payment.ac_notes != "" AND $preference.include_online_payment ==""} 
<hr><p class="c3"><span class="c4">{$LANG.notes}: {$payment.ac_notes|outhtml}</span></p>
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
