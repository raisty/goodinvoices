<h3>{$LANG.total_owed_per_customer}</h3>
<hr />

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    {literal}
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable({/literal}{$showReport}{literal});

        var options = {
          title: '{/literal}{$LANG.total_owed_per_customer}{literal}'
        };

        var chart = new google.visualization.{/literal}{$charttype}{literal}(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    {/literal}
    </script>


    <div id="chart_div" style="width: 100%; height: 600px;"></div>

