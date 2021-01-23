<?php
require_once('database.php');
$book_id=$_GET["book_id"];
$conn=mysqli_connect("localhost","root","","library database");
$query = "DELETE FROM book WHERE book_id='$book_id'";

$data = mysqli_query($conn,$query);
if($data)
{
    echo "<script>alert('record deleted')</script>";
    ?>
    <META http-equiv="Refresh" content="0; URL=http://localhost:3000/bookdetail.php">
    <?php
}
else{
    echo "<font color='red'>sorry delete process failed";
}
?>