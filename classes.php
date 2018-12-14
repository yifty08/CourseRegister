<?php
// Start the session
session_start();
?>
<!doctype html>
<html lang="en">
  <head>
    <?php include("header.php"); ?>
    <title>Our Classes</title>

  </head>

  <body>
    <?php include("nav.php"); ?>
    <main role="main">

      <div class="container">
         <?php
         $qs = $_SERVER['QUERY_STRING'];
         $sort = '';
        //  echo "QS:".$qs."<br/>";
         if ($qs == ""){
            showClasses();
         } else {
            // var_dump($_GET);
            if ($_GET["sort"]!=null){
              $sort = $_GET!=null && $_GET["sort"]!=null ? $_GET["sort"] : "";
              // var_dump($sort);
              showClasses($sort);
            } else {
                  showClassDetail($qs);
            }
        }
         ?>
      </div> <!-- /container -->

    </main>

    <?php include("footer.php"); ?>
    <script type='text/javascript'>
    function registerClass(id){
        alert('Registering for class ' + id);
        
    }
    </script>
  </body>
</html>