<?php
ob_start();
session_start();
?>

<!doctype html>
<?php include ("functions.php"); ?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/assets/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    
    <p>
    <?php
        if ($_SERVER["REQUEST_METHOD"]=="POST"){
            // $user = $_POST["inputUser"];
            // $pass = $_POST["inputPassword"];
            // echo 'User:'.$user.'<br/>';        
            // echo 'Pass:'.$pass.'<br/>';
            processLogin();
        } else {
            showLoginForm();
        }
    ?>
    </p>
  </body>
</html>x

<?php function showLoginForm(){ ?>
    <form class="form-signin" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
      <img class="mb-4" src="/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputUser" class="sr-only">Username</label>
      <input type="text" name="inputUser" id="inputUser" class="form-control" placeholder="Username" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <input class="btn btn-lg btn-primary btn-block" type="submit" value="Sign in"/>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
<?php } ?>

<?php
ob_end_flush();
?>