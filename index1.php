<!DOCTYPE html>
<html>
<head>
    <title>Search Bar using PHP</title>
</head>
<body>
 
<form method="post">
<label>Search</label>
<input type="text" placeholder="Search book by book_author" name="search">
<input type="submit" name="submit">
<br>

     
</form>
 
</body>
</html>
 
<?php
 
$con = new PDO("mysql:host=localhost;dbname=library database",'root','');
 
if (isset($_POST["submit"])) {
    $str = $_POST["search"];
    $sth = $con->prepare("SELECT * FROM `book_author` WHERE author_name = '$str'");
 
    $sth->setFetchMode(PDO:: FETCH_OBJ);
    $sth -> execute();
 
    if($row = $sth->fetch())
    {
        ?>
        <br><br><br>
        <h2><b>Searched Results</b></h2>
        <table>
            <tr>
            <th>book_id</th>
            <th>book_name</th>
            <th>author_name</th>
            </tr>
            <tr>
                <td><?php echo $row->book_id; ?></td>
                <td><?php echo $row->book_name;?></td>
                <td><?php echo $row->author_name; ?></td>
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
            echo "Book_Author Does not exist";
            ?>
            <br>
            <br>
            <br>
            <?php
        }
 
 
}

?>