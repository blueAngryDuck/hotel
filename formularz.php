<!DOCTYPE html>
<?php 

session_start();

if(isset($_POST['login']) && isset($_POST['pass'])) {
    // obsługa logowania
    $login = $_POST['login'];
    $pass = $_POST['pass'];

    if($login === "admin" && $pass === "admin") {
        session_destroy();
        session_start();
        $_SESSION['logged_user'] = $login;
        header('Location: admin.php');
    }
} else if(isset($_GET['logout']) || isset($_POST['logout'])) {
    session_destroy();
    header('Location: index.html');
}
?>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Logowanie</title>
   <link rel="stylesheet" href="styl.css">
</head>
<body>
    <main>
        <div class="container">
            <h5>strona administratora</h5>
           
            
        <form action="formularz.php" method="post">
            <label>
                <input type="text" name="login" placeholder="Login: admin">
            </label>
            <label>
                <input type="password" name="pass" placeholder="Hasło: admin">
            </label>
            <label>
                <input type="submit" value="Zaloguj się" name="zaloguj">
            </label> 
            <?php
            
            if(isset($_SESSION["er"]))
            {
                echo "<label>".$_SESSION['er']."</label>";
                unset($_SESSION["er"]);
            }

            // if(!isset($_GET['login'])) {
            //     exit();
            // }
            // $login = $_GET['login'];
            // $pass = $_GET['pass'];
                       
            ?>
        </form>
    </div>
    </main>
</body>
</html>

