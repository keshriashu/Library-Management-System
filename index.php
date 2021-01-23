<!DOCTYPE html>
<html>
<head>
    <title>Search Bar using PHP</title>
</head>
<body>
 
<form method="post">
<label>Search</label>
<input type="text" placeholder="Search book by title" name="search">
<input type="submit" name="submit">
<br>

     
</form>
 
</body>
</html>
 
<?php
 
$con = new PDO("mysql:host=localhost;dbname=library database",'root','');
 
if (isset($_POST["submit"])) {
    $str = $_POST["search"];
    $sth = $con->prepare("SELECT * FROM `book` WHERE Title = '$str'");
 
    $sth->setFetchMode(PDO:: FETCH_OBJ);
    $sth -> execute();
 
    if($row = $sth->fetch())
    {
        ?>
        <br><br>
        <h2><b>Searched Results</b></h2>
        <table>
            <tr>
            <th>book_id</th>
            <th>Title</th>
            <th>Publisher_Name</th>
            <th>Pub_year</th>
            </tr>
            <tr>
                <td><?php echo $row->book_id; ?></td>
                <td><?php echo $row->Title;?></td>
                <td><?php echo $row->Publisher_Name; ?></td>
                <td><?php echo $row->Pub_year; ?></td>

            </tr>
 
        </table>
        <br>
<br>
<br>
<br>
<br>
        

<?php 
    }
         
         
        else{
            echo "Book Does not exist";
        }
 
 
}

?>