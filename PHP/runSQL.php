<!-- based upon code oritionally written by Dr. Pete Tucker
Whitworth University
CS 396H-N 
Spring Semester 2016-->

<html><head><title>Execute SQL</title></head>
<body>

<?php
    //Open a connection
$connectionInfo = array("UID" => "IntelligenceCheck\username", 
                        "pwd" => "Password1", 
                        "Database" => "dbo.Players", 
                        "LoginTimeout" => 30, "Encrypt" => 1);
$serverName = "intelligence.database.windows.net,1433";
$conn = sqlsrv_connect($serverName, $connectionInfo) or die(print_r(sqlsrv_errors()));

  $SQL = "select * from PlayerTable"
     $res = sqlsrv_query($conn, $SQL) or die(print_r(sqlsrv_errors()));

  //       echo "\n<TABLE BORDER=1>\n";

  //       while ($row=sqlsrv_fetch_array($res)) {
  //           echo "<TR>";
  //           for ($ifld=1;$ifld<=$cfld;$ifld++) {
  // 	        echo "<TD>".$row[$ifld]."</TD>";
  //           }
  //           echo "</TR>";
  //       }

  //       echo "</TABLE>\n";

    echo "\ndone\n";
?>
</body></html>
