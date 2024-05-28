<!DOCTYPE html>
<?php
session_start();

if (!isset($_SESSION['logged_user'])) {
  header('Location: formularz.php');
}


$id = mysqli_connect('localhost', 'root', '', 'hotel');
if (!$id) {
  echo "Brak polaczenia z BD";
  exit();
}

if(isset($_POST['aktualizacjaReklamacji'])) {
  // var_dump($_POST);
  // obsługa aktualizacji stanu
  mysqli_query($id, "START TRANSACTION");

  $query = "UPDATE reklamacji SET status_reklamacji = 0";
  mysqli_query($id, $query);

  $id_obsluzonych_reklamacji = array_keys($_POST['box']);
  // var_dump($id_obsluzonych_reklamacji);
  $query = "UPDATE reklamacji SET status_reklamacji = 1 WHERE id IN (" . implode(',', $id_obsluzonych_reklamacji) . ")";
  mysqli_query($id, $query);

  mysqli_query($id, "COMMIT");
  // UPDATE reklamacji SET status = 1 WHERE id IN (4, 7, 10);
}

// if(!isset($_POST["login"]) || !isset( $_POST["pass"]))
// {
//     $_SESSION["error"] = "Uzyj formularza";
//     header("location: formularz.php");
//     exit();
// }

// if($_POST["login"] == "" || $_POST["pass"] == "")
// {
//     $_SESSION["error"] = "Nie wpisane dane do logowania";
//     header("location: formularz.php");
//     exit();
// }

// $login = $_POST['login'];
// $pass = $_POST['pass'];

// if($login!=="admin" || $pass!=="admin"){
//   $_SESSION["er"] = "Bledne dane logowania";
//     header("location: formularz.php");
//     exit();
//   }




$query = "SELECT reklamacji.id, klienci.imię, klienci.nazwisko, reklamacji.id_klienta, reklamacji.opis, reklamacji.status_reklamacji
FROM reklamacji INNER JOIN klienci  ON reklamacji.id_klienta = klienci.id";
$wynik = mysqli_query($id, $query);

$query1 = "SELECT * FROM rezerwacja";
$wynik1 = mysqli_query($id, $query1);

?>
<html lang="pl">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel KKZ</title>
  <link rel="shortcut icon" href="./img/kkz.logo.png" type="image/x-icon">

  <!-- 1Test1 -->
  <!-- 3Test3 -->

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/style.css">
</head>

<body>
  <header>
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
        <div class="container-fluid">
          <a class="navbar-brand" href="./index.html">
            <img src="./img/kkz.logo.png" alt="logo" id="logo">
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active text-uppercase" aria-current="page" href="galeria.html">Galeria</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active text-uppercase" aria-current="page" href="./pokoi.html">Pokoje</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active text-uppercase" aria-current="page" href="./index.html">O nas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-uppercase" href="./kontakty.html">Kontakt</a>
              </li>

            </ul>
            </li>
            <!-- <li class="nav-item">
                        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                      </li> -->
            </ul>
          </div>
        </div>
      </nav>
    </div>

  </header>
  <main>
    <div class="container admin">
      <div class="row">
        <div class="col-4">
        <form action="admin.php" method="post">
          <input type="hidden" name="aktualizacjaReklamacji" value='1'>
            <input type="submit" class="btn btn-primary" value="Zmień status reklamacji">
          </div>
          <div class="col-8">
            <table class="table table-striped table-hover">
              <thead>
                <tr>
                  <th scope="col">    </th>
                  <th scope="col">id</th>
                  <th scope="col">Imie</th>
                  <th scope="col">Nazwisko</th>
                  <th scope="col">id_klienta</th>
                  <th scope="col">Opis</th>
                  <th scope="col">Status</th>
                </tr>
              </thead>
              <tbody>

                <?php
                while ($row = mysqli_fetch_array($wynik)) {
                  $idreklamacji = $row['id'];
                  $imiekl = $row['imię'];
                  $nazwiskokl = $row['nazwisko'];
                  $idkl = $row['id_klienta'];
                  $opis = $row['opis'];
                  $status = $row['status_reklamacji'];

                  echo "<tr>";
                  echo "<td> <input type='checkbox' name='box[$idreklamacji]' id='box' " . ($status == 1 ? 'checked' : '') . " />  </td>";
                  echo "<td> $idreklamacji </td>";
                  echo "<td> $imiekl </td>";
                  echo "<td> $nazwiskokl </td>";
                  echo "<td> $idkl </td>";
                  echo "<td> $opis </td>";
                  echo "<td> $status </td>";
                  echo "</tr>";
                }
                ?>
              </tbody>
            </table>
          </div>
        </form>
      </div>
    </div>

    <div class="container admin">
      <div class="row">
        <div class="col-4">
          <form action="admin.php" method="post">
            <input type="submit" class="btn btn-primary" value="pokaz aktywne rezerwacje">
          </form>

        </div>
        <div class="col-8">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th scope="col">id_rezerwacji</th>
                <th scope="col">id_pokoje</th>
                <th scope="col">id_klienta</th>
                <th scope="col">Od</th>
                <th scope="col">Do</th>
              </tr>
            </thead>
            <tbody>
              <?php
              while ($row = mysqli_fetch_array($wynik1)) {
                $idrezerwacji = $row['id'];
                $idpok = $row['id_pokoju'];
                $idklienta = $row['id_klienta'];
                $od = $row['rezerwacja_od'];
                $do = $row['rezerwacja_do'];


                echo "<tr>";
                echo "<td> $idrezerwacji </td>";
                echo "<td> $idpok </td>";
                echo "<td> $idklienta </td>";
                echo "<td> $od </td>";
                echo "<td> $do </td>";
                echo "</tr>";
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </main>
  <div class="container md-12">
    <!-- Grid container -->

    <footer class="bg-secondary text-center  text-white"> <!-- text-lg-start -->
      <div class="container p-4">
        <!--Grid row-->
        <div class="row mt-4">
          <!--Grid column-->
          <div class="col-lg-4 col-md-6 mb-4 mb-md-0 text-lg-center">
            <h5 class="text-uppercase">Hotel kkz</h5>

            <ul class="list-unstyled mb-0">
              <li>
                <a href="#!" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Galeria</a>
              </li>
              <li>
                <a href="#!" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Pokoje</a>
              </li>
              <li>
                <a href="#!" class="text-white"><i class="fas fa-user-edit fa-fw fa-sm me-2"></i>O nas</a>
              </li>
            </ul>
          </div>

          <!--Grid column-->
          <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
            <h5 class="text-uppercase">Nasz Hotel</h5>

            <ul class="list-unstyled">
              <li>
                <a href="#!" class="text-white">Pracuj z nami</a>
              </li>
              <li>
                <a href="#!" class="text-white">Pracownicy</a>
              </li>
              <!-- <li>
                    <a href="#!" class="text-white">05765 NY</a>
                  </li> -->
              <!-- <li>
                    <a href="#!" class="text-white"><i class="fas fa-briefcase fa-fw fa-sm me-2"></i>Send us a book</a>
                  </li> -->
            </ul>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-lg-4 col-md-6 mb-4 mb-md-0 text-lg-center">
            <h5 class="text-uppercase">Kontakt:</h5>

            <ul class="list-unstyled">
              <li>
                <a href="./kontakty.html" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>telefon: 717562744</a>
              </li>
              <li>
                <a href="https://www.google.com/maps/place/Fabryczna+13,+53-609+Wroc%C5%82aw/@51.1124513,16.9884196,17z/data=!3m1!4b1!4m6!3m5!1s0x470fc125a8ba11ab:0x8ee1f89f4994c03a!8m2!3d51.112448!4d16.9909945!16s%2Fg%2F11n14ch1n1?entry=ttu" target="_blank" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>ul. Fabryczna</a>
              </li>
              <li>
                <a href="https://www.google.com/maps/place/Fabryczna+13,+53-609+Wroc%C5%82aw/@51.1124513,16.9884196,17z/data=!3m1!4b1!4m6!3m5!1s0x470fc125a8ba11ab:0x8ee1f89f4994c03a!8m2!3d51.112448!4d16.9909945!16s%2Fg%2F11n14ch1n1?entry=ttu" target="_blank" class="text-white"><i class="fas fa-envelope fa-fw fa-sm me-2"></i>53-609 Wrocławr</a>
              </li>
            </ul>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </div>
      <!-- Grid container -->

      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2023 TEB Edukacja Wroclaw
      </div>

      <!-- Copyright -->
    </footer>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <?php mysqli_close($id); ?>

</body>

</html>