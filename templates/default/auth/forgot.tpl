<div style="font-family: 'Lucida Grande', verdana, arial, helvetica, sans-serif; color: #333; font-size: 16px;">
{if $errorMessage }
<p align="center" style="font-size: 20px;"><strong><font color="#990000">{$errorMessage|outhtml}</font></strong><br /><br /></p>
{/if}
	<div>
		<center>
		<form action="" method="post" id="frmForgot" name="frmForgot">
		<input type="hidden" name="action" value="forgot" />
		<dl>
      <table>
  		<tr>
            <td colspan="2" style="text-align: center;" class="welcome">
                <span style="font-size: 10px;">{$LANG.forgot_info}</span>
            </td>
      </tr>
      <tr>
            <td colspan="2" style="text-align: center;">
               <hr />
            </td>
      </tr> 
      <tr>
            <td>
                {$LANG.email}:
            </td>
            <td>
  		        <input name="email" size="25" type="text" title="email" value="" />
            </td>
      </tr>       
  		<tr>
            <td colspan="2">
                {literal}
                 <script type="text/javascript">
                 var RecaptchaOptions = {
                    theme : 'clean'
                 };
                 </script>
                {/literal}
                {$recaptcha}
            </td>
      </tr>       
  		<tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="{$LANG.send_to_mail}" style="font-size: 20px;" />
            </td>
      </tr>       
      </table>
		</form>
    </center>
	</div>
</div>

<script language="text/javascript">
	<!--
	document.frmForgot.email.focus();
	//-->
</script>
