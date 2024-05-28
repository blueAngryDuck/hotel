<?php
if(!isset($_POST['imie'])){
  exit();
}
$id=mysqli_connect("localhost", "root", "", "hotel");
if(!$id){
  exit();
}
$imie=$_POST['imie'];
$nazwisko=$_POST['nazwisko'];
$mail=$_POST['mail'];
$adres=$_POST['adres'];
$telefon=$_POST['telefon'];
$dataod=$_POST['dataod'];
$datado=$_POST['datado'];

if(empty($imie) || empty($nazwisko) || empty($mail) || empty($adres) || empty($telefon) || empty($dataod) || empty($datado)){
 header ("location: rezerwacja5.php");
}
else {
  $zap1="INSERT INTO klienci (imię, nazwisko, e_mail, telefon, adres) VALUES ('$imie', '$nazwisko', '$mail', '$telefon', '$adres')";
$wynikzap1=mysqli_query($id, $zap1);
$lastidklienta = mysqli_insert_id($id);
$zap2=" INSERT INTO rezerwacja (id_pokoju, rezerwacja_od, rezerwacja_do, id_pracownika, id_klienta) VALUES ('5', '$dataod', '$datado', '2', '$lastidklienta')";
$wynikzap2=mysqli_query($id, $zap2);
}


mysqli_close($id);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel KKZ</title>
    <link rel="shortcut icon" href="./img/kkz.logo.png" type="image/x-icon">

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
                        <a class="nav-link active text-uppercase" aria-current="page" href="./onas.html">O nas</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link text-uppercase" href="./kontakty.html">Kontakt</a>
                      </li>
                      
                        </ul>
                      </li>
                  
                    </ul>
                    </div>
                </div>
              </nav>
        </div> 
        <div class="container">
            <div class="row">
                <img src="./img/Budynek_nr_13_ul_Fabryczna_Wroclaw_417314.1.jpg" class="img-fluid" alt="hotel">
                <div class="bottom-left text-bg-secondary textf"><h2><i>Witamy na stronie hotelu KKZ.INF-03</i></h2></div>
            </div>
        </div>
    </header>
    <main>
      <div class="container"><div class="card mb-5" style="max-width: 1320px;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="https://www.scandichotelsgroup.com/images/7fe0dbb7-c659-47a3-9056-974cdf039cad/sp-l/2020---fo--rnybar-el_print.webp" class="img-fluid rounded-start" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Udało się</h5>
              <p class="card-text">Zarezerwowałes pokoj</p>
              
            </div>
          </div>
        </div>
      </div>
    </div>
    
      
    </main>
    
    
      <div class="container md-12">
          <!-- Grid container -->
        
        <footer class="bg-secondary text-center  text-white">   <!-- text-lg-start -->
          <div class="container p-4">
            <!--Grid row-->
            <div class="row mt-4">
              <!--Grid column-->
              <div class="col-lg-4 col-md-6 mb-4 mb-md-0 text-lg-center">
                <h5 class="text-uppercase">Hotel kkz</h5>
      
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="galeria.html" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Galeria</a>
                  </li>
                  <li>
                    <a href="pokoi.html" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Pokoje</a>
                  </li>
                  <li>
                    <a href="./onas.html" class="text-white"><i class="fas fa-user-edit fa-fw fa-sm me-2"></i>O nas</a>
                  </li>
                </ul>
              </div>
              <!--Grid column-->
      
      
              <!--Grid column-->
              <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">Nasz Hotel</h5>
      
                <ul class="list-unstyled">
                  <li>
                    <a href="./formularz.html" class="text-white">Pracuj z nami</a>
                  </li>
                  <li>
                    <a href="./pracowniki.html" class="text-white">Pracownicy</a>
                  </li>
                 
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
          <div class="text-decoration-none text-xxl-end p-3" style="background-color: rgba(0, 0, 0, 0.2)">
             <a href="formularz.php">strona administratora</a>
          </div>
          <!-- Copyright -->
        </footer>
      </div>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>