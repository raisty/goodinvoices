{*
/*
* Script: manage.tpl
* 	 Customer manage template
*	 added an extra action, and a 'last invoice' column
*        Only the include file has changed
*	 in xml.php the query is extended 
*	 to retrieve the last invoice for this customer too
*/
*}

{if $number_of_customers.count == 0}
	<p><em>{$LANG.no_customers}</em></p>
{else}

<h3>{$LANG.manage_customers} :: <a href="index.php?module=customers&view=add">{$LANG.customer_add}</a></h3>
<hr />
<table id="manageGrid" style="display:none"></table>

 {include file='../extensions/default_invoice/modules/customers/manage.js.php'}

{/if}
