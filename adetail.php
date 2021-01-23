<?php
include_once 'database.php';
include_once 'index1.php';
?>
<br>
<button class="button"><a href="test.html">back to main</a></button>
<?php
$result = mysqli_query($conn,"CALL `getbookauthors`();");
?>
<!DOCTYPE html>
<html>
 <head>
 <title>Library Database</title>
 </head>
<body>
<style>
    table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;

}

tr:nth-child(even) {
    background-color: white;
}
</style>
<?php
if (mysqli_num_rows($result) > 0) {
?>
  <table>
  <tr>
    <td>book_id</td>
    <td>book_name</td>
    <td>author_name</td>
    <td>Options</td>
  </tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
      <td><?php echo $row["book_id"]; ?></td>
      <td><?php echo $row["book_name"]; ?></td>
      <td><?php echo $row["author_name"]; ?></td>
      <td style="text-align:center; width:150px">
        <span><a href="aupdate.php?book_id=<?php echo $row['book_id']; ?> && book_name=<?php echo $row['book_name']; ?> && author_name=<?php echo $row['author_name']; ?> " value="Edit">Update</a></span>
        <span><a href="adel.php?book_id=<?php echo $row['book_id']; ?> " onclick="return checkdelete()" value="Delete">Delete</a></span>
      </td>
</tr>
<?php
$i++;
}
?>
</table>
 <?php
}
else{
    echo "No result found";
}
?>

 </body>
</html>