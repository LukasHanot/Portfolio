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


        foreach($feedbacks as $grafiek){
            echo "<p>";
            echo '  antwoordID:';
            echo $grafiek->antwoordID ;
            echo "  Totaal:";
            echo $grafiek->total;
            echo "  VraagID:";
            echo $grafiek->vraagID;
            echo "</p>";


        }



     ?>




</body>

</html>