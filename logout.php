<?php
ob_start();
session_start();
?>

<!DOCTYPE html>
<html>
<body>

<?php
// remove all session variables
session_unset(); 

// destroy the session 
session_destroy(); 
header("Location:index.php");
?>

</body>
</html>

<?php
ob_end_flush();
?>