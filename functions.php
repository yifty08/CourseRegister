<?php

// function dbConnectZZZ($sql){
//     $user = 'root';
//     $password = 'root';
//     $db = 'academy';
//     $host = 'localhost';
//     $port = 8889;

//     $link = mysqli_init();
//     $success = mysqli_real_connect(
//        $link, 
//        $host, 
//        $user, 
//        $password, 
//        $db,
//        $port
//     );    

// }

function dbConnect($sql){
    $DBSERVER = '127.0.0.1';
    $DBUSER = 'root';
    $DBNAME = 'academy';
    $PASSWORD = '';
    $DBPORT = 8889;
    $conn = new mysqli('127.0.0.1', 'root', 'root','academy',8889);
//    $conn = new mysqli($DBSERVER, $DBUSER, $PASSWORD, null, $DBNAME, $DBPORT);
    
    if ($conn->connect_error) {
        die('Connect Error (' . $conn->connect_errno . ') '
                . $conn->connect_error);
    }

//    $sql = "SELECT id, firstname, lastname FROM MyGuests";
    $result = $conn->query($sql);
//    var_dump($result);
    
    // echo '<p>Connection OK '. $mysqli->host_info.'</p>';
    // echo '<p>Server '.$mysqli->server_info.'</p>';
    $conn->close();
    return $result;
}

function sayHello(){
    echo "Hwllo, World";
}

function listModels($b, $m){
    // var_dump($b);
    // var_dump($m);
    // echo "inside ListModels";
    $sOut = "<ul>$b has ".count($m). " models:";
    for($i=0;$i<count($m);$i++){
        $sOut .= "<li>".$m[$i]."</li>";
    }
    $sOut .="</ul>";
    return $sOut;
}
function printBrands($arBrand){
    var_dump($arBrand);
    $strOut = "";
    foreach($arBrand as $brand=>$models){
        // var_dump($brand);
        // var_dump($models);
        echo listModels($brand, $models);
    }
    return $strOut;
}

function buildMenu($arMenus){
    $page = $_SERVER['PHP_SELF'];
    // echo 'SELF: '.$_SERVER['PHP_SELF'];
    // echo 'SCRIPT NAME: '.$_SERVER['SCRIPT_NAME'];
//    var_dump($arMenus);
    $strOut = "<ul class='navbar-nav mr-auto'>";
    foreach($arMenus as $k=>$v) {
        // $pos = strpos($page, $v["link"]);
        $class = strpos($page, $v["link"]) === false ? '' : 'active';
        $strOut .= "<li class='nav-item $class'>";
        $strOut .= "<a class='nav-link' href=".$v["link"].">".$v["title"]."</a>";
        $strOut .= "</li>";
        $class = '';
    }

    $strOut .= '</ul>';
    echo $strOut;
}

function userProfile(){
    $cookie_name = "user";
    // var_dump($_SESSION);
    if ($_SESSION != null){
        $fullname = $_SESSION["FullName"];
        $strOut = '<li class="nav-item dropdown">';
        $strOut .= '<a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.$fullname.'</a>';
        $strOut .= '<div class="dropdown-menu" aria-labelledby="dropdown01">'.
          '<a class="dropdown-item" href="profile.php">Your Profile</a>'.
          '<a class="dropdown-item" href="courses.php">Your Courses</a>'.      
          '<a class="dropdown-item" href="logout.php">Logout</a>'.      
        '</div>'.
        '</li>';    
    } else {
        $strOut = '<li class="nav-item">';
        $strOut .= '<a class="nav-link" href="login.php">Login</a>';
        $strOut .= '</li>';
    }
    echo $strOut;
}

function showCourses(){
    // $strOut = "<h2>Hello Courses</h2>";
    $sql = "SELECT * FROM COURSES order by Name";
    $courses = dbConnect($sql);
//    var_dump($courses);
    $strOut = "";
    if ($courses->num_rows > 0) {
        // output data of each row
        while($row = $courses->fetch_assoc()) {
            $strOut .= "id: " . $row["CourseID"]. " - Name: " . $row["Name"]. " ";
            $strOut .= "<a href='courses.php?id=".$row["CourseID"]."'>".$row["Title"]. "</a><br>";
        }
    } else {
        $strOut .= "0 results";
    }    
    echo $strOut;
}

function showCourseDetail($qs){
//    $strOut = "<h2>Hello Course Detail</h2>";
    $arQS = explode('=',$qs);
    var_dump($arQS);
    $sql = "SELECT * FROM COURSES where CourseId=".$arQS[1];
    var_dump($sql);
    $courses = dbConnect($sql);
//    var_dump($courses);
    if ($courses->num_rows > 0) {
        // output data of each row
        while($row = $courses->fetch_assoc()) {
            $strOut = "<h2>".$row["Title"]."</h2>";
            $strOut .= "<strong>Course ID: </strong> " . $row["CourseID"]."<br/>";
            $strOut .= "<strong>Name: </strong> " . $row["Name"]. "<br/>";
            $strOut .= "<strong>Title: </strong>".$row["Title"]. "<br/>";
            $strOut .= "<strong>Description: </strong> ".$row["Description"]. "<br/>";
        }
    } else {
        $strOut .= "Course with ID=".$arQS[1]." is not found";
    }    
    echo $strOut;
}

function showStudents(){
    $strOut = "<h2>Hello Students</h2>";
    $sql = "SELECT * FROM Students order by FirstName, LastName";
    $students = dbConnect($sql);
//    var_dump($courses);
    if ($students->num_rows > 0) {
        // output data of each row
        while($row = $students->fetch_assoc()) {
            $strOut .= "id: " . $row["StudentID"]. " - Name: "; 
            $strOut .= $row["FirstName"]. " " . $row["LastName"];
            $strOut .= " <a href='students.php?id=".$row["StudentID"]."&mode=view'>View<a/> | ";
            $strOut .= "<a href='students.php?id=".$row["StudentID"]."&mode=edit'>Edit<a/><br/>";
        }
    } else {
        $strOut .= "0 results";
    }    
    echo $strOut;
}

function viewStudent($id){
    $strOut = "<h2>View Students</h2>";
    $sql = "SELECT * FROM Students where StudentId=".$id;
    $students = dbConnect($sql);
//    var_dump($courses);
    if ($students->num_rows > 0) {
        // output data of each row
        while($row = $students->fetch_assoc()) {
            $strOut .= "id: " . $row["StudentID"]."<br/>"; 
            $strOut .= "Name: ".$row["FirstName"]. " " . $row["LastName"]."<br/>";
            $strOut .= "Other details here";
        }
    } else {
        $strOut .= "0 results";
    }    
    echo $strOut;
}

function editStudent($id){
    $strOut = "<h2>Edit Students</h2>";
    $strOut .= "<form id='frmStudent' action='".$_SERVER["PHP_SELF"]."' method='POST'>";
    $sql = "SELECT * FROM Students where StudentId = $id";
    $students = dbConnect($sql);
//    var_dump($courses);
    $strOut .= "<fieldset><legend>Student Details</legend>";
    if ($students->num_rows > 0) {
        // output data of each row
        while($row = $students->fetch_assoc()) {
            // var_dump($row);
            // $strOut .= "id: " . $row["StudentID"]; 
            $strOut .= "<input type='hidden' name='id' value='".$row["StudentID"]."'>";
            // $strOut .= "<label>StudentId: <input type='text' disabled name='StudentID' value='".$row["StudentID"]."'></label>";
            $strOut .= "<label>First Name: <input type='text' name='fName' value='".$row["FirstName"]."'></label>";
            $strOut .= "<label>Last Name: <input type='text' name='lName' value='".$row["LastName"]."'></label>";
            $strOut .= "<label>Birtdate: <input type='date' name='bDate' value='".$row["BirthDate"]."'></label>";
        }
    } else {
        $strOut .= "0 results";
    }    
    $strOut .= "<p><input type='button' value='Save' onclick='saveStudent();'></p>";
    $strOut .= "</fieldset></form>";
    echo $strOut;
}

function saveStudent(){
    echo "Saving Student with data:<br/>";
    var_dump($_POST);
    $student->save();
    $sql = "UPDATE Students set FirstName = '".$_POST["fName"]."', ";
    $sql .= "LastName = '".$_POST["lName"]."' where StudentId=".$_POST["id"];
//    var_dump($sql);
    $students = dbConnect($sql);
    // header('Location: students.php');
}

function processLogin(){
    $username = $_POST["inputUser"];
    $pass = $_POST["inputPassword"];
    $pwdhash = md5($pass);
    $sql = "SELECT * FROM students where username='$username' and userpassword='$pwdhash'";
//    echo $sql;
    $user = dbConnect($sql);
    $userInfo = array("");
    if ($user->num_rows > 0) {
        // output data of each row
//        var_dump($user);
        echo "User found";
        while($row = $user->fetch_assoc()) {
            var_dump($row);
            $_SESSION["Username"] = $row["Username"];
            $_SESSION["FullName"] = $row["FirstName"].", ".$row["LastName"];
            // echo $_SESSION;
           header("Location:courses.php");
            // echo "<a href=index.php>back to homepage</a>";
        }
    } else {
        echo "User not found";
    }
    return $userInfo;
}

function showClasses($orderby = null){
    $strOut = "<h2>Hello Classes</h2>";
    $sql = "select CL.ClassID, CL.StartDate, CL.Time, CL.Dates, CR.Name, CR.Title, 
        CR.Description, concat(I.FirstName,' ', I.LastName) as InstructorName
        from classes as CL
        inner join courses as CR on CL.CourseID=CR.CourseID
        inner join instructor as I on CL.InstructorID=I.InstructorID";
        switch($orderby){
            case "name": $sql .= " order by Name";
                break;
            case "id": $sql .= " order by ClassID";
                break;
            case "instr": $sql .= " order by InstructorName";
                break;
            default:
                break;            
        }
        // var_dump($sql);

    $classes = dbConnect($sql);
//    var_dump($classes);
    if ($classes->num_rows > 0) {
        $strOut = "<table border='1'>";
        $strOut .= "<thead><tr><td><a href='classes.php?sort=id'>Course ID</a></td>
            <td><a href='classes.php?sort=name'>Name</a></td>
            <td><a href='classes.php?sort=instr'>Instructor</a></td>";
        if ($_SESSION!=null){
            $strOut .= "<td>Action</td>";
        }
        $strOut .= "</tr></thead>";
        // output data of each row
        while($row = $classes->fetch_assoc()) {
//            var_dump($row);
            $strOut .= "<tr><td>id: " . $row["ClassID"]. " - Name: " . $row["Name"]. " </td>";
            $strOut .= "<td><a href='classes.php?id=".$row["ClassID"]."'>".$row["Title"]. "</a></td>";
            $strOut .= "<td>".$row["InstructorName"]. "</td>";
            if ($_SESSION!=null){
                $btnId = 'btnRegister_' . $row["ClassID"];
                $strOut .= "<td><input type='button' value='Register' name='btnRegister' id='$btnId' onclick='registerClass(".$row["ClassID"].")'></td>";
            }
            $strOut .= "</tr>";
        }
        $strOut .= "</table>";
    } else {
        $strOut .= "0 results";
    }    
    echo $strOut;
}

?>