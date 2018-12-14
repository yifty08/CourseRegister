<?php
include("../functions.php");
// Array with names
// get the q parameter from URL
$q = $_REQUEST["q"];
$sql = "select * from courses where title like '%".$q."%'";
$courses = dbConnect($sql);
var_dump($sql);
$strOut = "<ul>";

// lookup all hints from array if $q is different from "" 
if ($q !== "") {
    if ($courses->num_rows > 0) {
        // output data of each row
        while($row = $courses->fetch_assoc()) {
            // build a string like this with loop
            // <a href="courses.php?id=1">Web Design 1</a>
            $strOut .= "<li><a href='courses.php?id=".$row["CourseID"]."'>".$row["Name"]." - ".$row["Title"]."</a></li>";
        }
    }
}
$strOut .= "</ul>";
// Output "no suggestion" if no hint was found or output correct values 
echo $strOut === "" ? "no suggestion" : $strOut;
?>