<?php
require_once('database.php');

   $_GET["branch_id"]; 
   $_GET["branch_name"]; 
   $_GET["address"]; 
?>
<!DOCTYPE html>
<html>
    <head>
        <title>
        library_branches entry
        </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    
        <link rel="stylesheet" href="css/signup.css">
    </head>
    
    

    <body>
        
        <div class="container">
        <div class="row">
        <div class="col-sm-3">

      <center> <h1> Library_BranchesEDIT</h1></center><br><br>
        <form action="" method="GET">
        branch_id <input class="form-control" type="text" name="branch_id" value="<?php echo $_GET['branch_id']; ?>"/><br><br>
        branch_name <input class="form-control" type="text" name="branch_name" value="<?php echo $_GET['branch_name']; ?>"/><br><br>
        address <input class="form-control" type="text" name="address" value="<?php echo $_GET['address']; ?>"/><br>
          <input class="btn btn-primary" type="submit" name="submit" value="update">
        </form>
        </div>
        </div>
        </div>
        <?php
          if(isset($_GET['submit']))
          {
            $branch_id = $_GET['branch_id'];
            $branch_name = $_GET['branch_name'];
            $address = $_GET['address'];
            $conn=mysqli_connect("localhost","root","","library database");
            $query = "UPDATE library_branches SET branch_name='$branch_name' , address='$address' WHERE branch_id='$branch_id'";
            $data = mysqli_query($conn,$query);
            echo "<script>alert('record updated')</script>";
    ?>
    <META http-equiv="Refresh" content="0; URL=http://localhost:3000/bdetail.php">
    <?php
          }
        
         ?>
         </body>
         </html>
