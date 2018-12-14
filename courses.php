<?php
// Start the session
session_start();
?>
<!doctype html>
<html lang="en">
  <head>
    <?php include("header.php"); ?>
    <title>Our Courses</title>

  </head>

  <body>
    <?php include("nav.php"); ?>
    <main role="main">

      <div class="container">
         <?php
         $qs = $_SERVER['QUERY_STRING'];
         echo "QS:".$qs."<br/>";
         if ($qs == ""){
            showCourses();
         } else {
            showCourseDetail($qs);
         }
         ?>
      </div> <!-- /container -->

    </main>

    <?php include("footer.php"); ?>
  </body>
</html>
