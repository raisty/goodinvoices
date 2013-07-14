<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>{$LANG.simple_invoices}</title>
<link rel="stylesheet" type="text/css" href="./templates/default/css/login.css" />
</head>
<body class="login" >
<div class="Container">
{if $errorMessage }
<p align="center"><strong><font color="#990000">{$errorMessage|outhtml}</font></strong><br /><br /></p>
{/if}
	<div id="Dialog">
		<center>
            <div><img src="./templates/default/logo.png" alt="Invoices" /></div>
            <div><h1>{$LANG.simple_invoices}</h1></div>
            <div style="font-family: times, Times New Roman, times-roman, georgia, serif; font-size: 22px; font-style: italic;">{$LANG.for}&nbsp;{php}echo htmlspecialchars($_SERVER['SERVER_NAME']);{/php}</div>
		<form action="" method="post" id="frmLogin" name="frmLogin">
	        <input type="hidden" name="action" value="login" />
		<dl>
        <table>
  		<tr>
            <td>
                {$LANG.email}:
            </td>
            <td>
  		        <input name="user" size="25" type="text" title="user" value="{$login_data}" />
            </td>
        </tr>       
  		<tr>
            <td>
                {$LANG.password}:
            </td>
            <td>
  		        <input name="pass" size="25" type="password" title="password" value="" />
            </td>
        </tr>       
  		<tr>
            <td>
            </td>
            <td>
                <input name="time_val" type="hidden" value="{$time_data}" />
                <input type="submit" value="{$LANG.login}" style="font-size: 20px;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <br /><a href="?module=auth&view=forgot" style="font-size: 12px; color: #999;">{$LANG.forgot_password}</a>
            </td>
        </tr>       
        </table>
		</form>
        </center>
        <br />
	</div>
        <a href="https://bitbucket.org/maxsamael/simpleinvoices-fork" target="_blank" style="font-size: 10px; color: #aaa; text-decoration: none;">{$LANG.simple_invoices_powered_by}</a>
</div>

<script language="JavaScript">
	<!--
	document.frmLogin.user.focus();
	//-->
</script>

</body>
</html>
