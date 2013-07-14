

<div id="top"><h3>{$LANG.monthly_sales_per_year}</h3></div>
<form type="get" action="index.php">
  <input type="hidden" name="module" value="reports" />
  <input type="hidden" name="view" value="report_sales_by_periods" />
  <select name="y" style="font-size: 16px;" onChange="this.form.submit();">
    {foreach item=year_opt key=year_key from=$inyear}
      <option value="{$year_key}" {if $year_opt==true}selected="SELECTED"{/if}>{$year_key}</option>
    {/foreach}
  </select>
</form>
 <hr />

{foreach item=year from=$years}

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    {literal}
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable({/literal}{$results.$year}{literal});

        var options = {
          title: '{/literal}{$LANG.monthly_sales_per_year} {$year}{literal}',
          vAxis: {title: '{/literal}{$year}{literal}'},
          colors: ['#007236','#dc2a12']
        };

        var chart = new google.visualization.{/literal}{$charttype.$year}{literal}(document.getElementById('chart_div_{/literal}{$year}{literal}'));
        chart.draw(data, options);
      }
    {/literal}
    </script>


    <div id="chart_div_{$year}" style="width: 100%; height: 600px;"></div>


    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    {literal}
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable({/literal}{$results_total.$year}{literal});

        var options = {
          title: '{/literal}{$LANG.total} {$year}{literal}',
          colors: ['#007236','#dc2a12']
        };

        var chart = new google.visualization.{/literal}{$charttype_total.$year}{literal}(document.getElementById('chart_total_div_{/literal}{$year}{literal}'));
        chart.draw(data, options);
      }
    {/literal}
    </script>


    <div id="chart_total_div_{$year}" style="width: 100%; height: 400px;"></div>
{/foreach}