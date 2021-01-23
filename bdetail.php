<?php
include_once 'database.php';
include_once 'index2.php';
?>
<button class="button"><a href="test.html">back to main</a></button>
<?php
$result = mysqli_query($conn,"CALL `showlibrarybranches`();");
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
    <td>branch_id</td>
    <td>branch_name</td>
    <td>address</td>
    <td>Options</td>
  </tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
      <td><?php echo $row["branch_id"]; ?></td>
      <td><?php echo $row["branch_name"]; ?></td>
      <td><?php echo $row["address"]; ?></td>
      <td style="text-align:center; width:150px">
        <span><a href="bupdate.php?branch_id=<?php echo $row['branch_id']; ?> && branch_name=<?php echo $row['branch_name']; ?> && address=<?php echo $row['address']; ?>" value="Edit">Update</a></span>
        <span><a href="bdel.php?branch_id=<?php echo $row['branch_id']; ?> " onclick="return checkdelete()" value="Delete">Delete</a></span>
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