<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/spectrum/1.8.0/spectrum.min.css" type="text/css" />
    <link href="css/jquery.jexcel.css" rel="stylesheet" />
    <link href="css/jquery.jcalendar.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.3/jquery.mask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-csv/0.71/jquery.csv-0.71.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/spectrum/1.8.0/spectrum.min.js"></script>
    <script src="js/excel-formula.min.js"></script>

    <script src="js/jquery.jexcel.js"></script>
    <script src="js/jquery.jcalendar.js"></script>
</head>

<body>
    <div class="container">
        <div id="demo1"></div>
    </div>
    <script>
    data1 = [
        ['Google', 1998, 807.80],
        ['Apple', 1976, 116.52],
        ['Yahoo', 1994, 38.66],
    ];

    $('#demo1').jexcel({ data:data1, colWidths: [ 300, 80, 100 ] });
    </script>
</body>
</html>
