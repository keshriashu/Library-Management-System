<?php
include_once 'database.php';
include_once 'index.php';
?>
<button class="button"><a href="test.html">back to main</a></button>
<?php
$result = mysqli_query($conn,"CALL `getbooks`();");
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
    <td>Title</td>
    <td>Publisher_Name</td>
    <td>Pub_year</td>
    <td>Options</td>
  </tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
      <td><?php echo $row["book_id"]; ?></td>
      <td><?php echo $row["Title"]; ?></td>
      <td><?php echo $row["Publisher_Name"]; ?></td>
      <td><?php echo $row["Pub_year"]; ?></td>
      <td style="text-align:center; width:150px">
        <span><a href="bookupdate.php?book_id=<?php echo $row['book_id']; ?> && Title=<?php echo $row['Title']; ?> && Publisher_Name=<?php echo $row['Publisher_Name']; ?>&& Pub_year=<?php echo $row['Pub_year']; ?> " value="Edit">Update</a></span>
        <span><a href="bookdel.php?book_id=<?php echo $row['book_id']; ?> " onclick="return checkdelete()" value="Delete">Delete</a></span>
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