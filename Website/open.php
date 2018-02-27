<?php
    include 'conf.php';
    $mysqli = new mysqli($dbhost,$dbuser,$dbpass,$dbname);

    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        die ('Error connecting to mysql. :-( <br/>');
    } else {
        //echo 'Yes, we have connected to MySQL! :-) <br/>';
    }
?>
