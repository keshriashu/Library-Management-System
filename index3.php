<!DOCTYPE html>
<html>
<head>
    <title>Search Bar using PHP</title>
</head>
<body>
 
<form method="post">
<label>Search</label>
<input type="text" placeholder="Search publisher name" name="search">
<input type="submit" name="submit">
<br>

     
</form>
 
</body>
</html>
 
<?php
 
$con = new PDO("mysql:host=localhost;dbname=library database",'root','');
 
if (isset($_POST["submit"])) {
    $str = $_POST["search"];
    $sth = $con->prepare("SELECT * FROM `publisher` WHERE name = '$str'");
 
    $sth->setFetchMode(PDO:: FETCH_OBJ);
    $sth -> execute();
 
    if($row = $sth->fetch())
    {
        ?>
        <br><br><br>
        <h2><b>Search Results</b></h2>
        <table>
            <tr>
            <th>name</th>
            <th>address</th>
            <th>phone_number</th>
            </tr>
            <tr>
                <td><?php echo $row->name; ?></td>
                <td><?php echo $row->address;?></td>
                <td><?php echo $row->phone_number; ?></td>
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
            ?>
            <br>
            <br>
            <br>
            <?php
        }
 
 
}

?>