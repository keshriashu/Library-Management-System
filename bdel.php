<?php
require_once('database.php');
$branch_id=$_GET["branch_id"];
$conn=mysqli_connect("localhost","root","","library database");
$query = "DELETE FROM library_branches WHERE branch_id='$branch_id'";

$data = mysqli_query($conn,$query);
if($data)
{
    echo "<script>alert('record deleted')</script>";
    ?>
    <META http-equiv="Refresh" content="0; URL=http://localhost:3000/bdetail.php">
    <?php
}
else{
    echo "<font color='red'>sorry delete process failed";
}
?>