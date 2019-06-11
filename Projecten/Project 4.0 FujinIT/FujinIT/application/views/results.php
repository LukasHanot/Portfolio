<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo $titel ?></title>





</head>

<body>


<?php


    foreach($questions as $i=>$row){

        echo '<br>';
        echo $row['Titel'];
        echo '<br>';
        echo '0: ';
        echo $row['0.0'];
        echo '<br>';
        echo '0.5: ';
        echo $row['0.5'];
        echo '<br>';
        echo '1: ';
        echo $row['1.0'];
        echo '<br>';
        echo '1.5: ';
        echo $row['1.5'];
        echo '<br>';
        echo '2: ';
        echo $row['2.0'];
        echo '<br>';
        echo '2.5: ';
        echo $row['2.5'];
        echo '<br>';
        echo '3: ';
        echo $row['3.0'];
        echo '<br>';
        echo '3.5: ';
        echo $row['3.5'];
        echo '<br>';
        echo '4: ';
        echo $row['4.0'];
        echo '<br>';
        echo '4.5: ';
        echo $row['4.5'];
        echo '<br>';
        echo '5 :';
        echo $row['5.0'];















    }



?>




</body>

</html>