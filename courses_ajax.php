<?php
// Start the session
session_start();
?>
<!doctype html>
<html lang="en">
  <head>
    <?php include("header.php"); ?>
    <title>Our Courses</title>
    <script>
        function showHint(str) {
            if (str.length == 0) { 
                document.getElementById("txtHint").innerHTML = "";
                return;
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("courseList").innerHTML = this.responseText;
                    }
                };
                xmlhttp.open("GET", "api/getcourses.php?q=" + str, true);
                xmlhttp.send();
            }
        }
    </script>    

  </head>

  <body>
    <?php include("nav.php"); ?>
    <main role="main">
    <h2>Courses using AJAX</h2>
    <form> 
        Course Name: <input type="text" onkeyup="showHint(this.value)">
    </form>
      <div class="container">
        <div id="courseList">
            <?php
            $qs = $_SERVER['QUERY_STRING'];
            echo "QS:".$qs."<br/>";
            if ($qs == ""){
                showCourses();
            } else {
                showCourseDetail($qs);
            }
            ?>
         </div>
      </div> <!-- /container -->

    </main>

    <?php include("footer.php"); ?>
  </body>
</html>
