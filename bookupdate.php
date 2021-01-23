<?php
require_once('database.php');

   $_GET["book_id"]; 
   $_GET["Title"]; 
   $_GET["Publisher_Name"]; 
   $_GET["Pub_year"]; 

?>
<!DOCTYPE html>
<html>
    <head>
        <title>
            book entry
        </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    
        <link rel="stylesheet" href="css/signup.css">
    </head>
    
    

    <body>
        
        <div class="container">
        <div class="row">
        <div class="col-sm-3">

      <center> <h1>BOOK EDIT</h1></center><br><br>
        <form action="" method="GET">
        book_id <input class="form-control" type="text" name="book_id" value="<?php echo $_GET['book_id']; ?>"/><br><br>
        Title <input class="form-control" type="text" name="Title" value="<?php echo $_GET['Title']; ?>"/><br><br>
        Publisher_Name <input class="form-control" type="text" name="Publisher_Name" value="<?php echo $_GET['Publisher_Name']; ?>"/><br>
        Pub_year <input class="form-control" type="text" name="Pub_year" value="<?php echo $_GET['Pub_year']; ?>"/><br>

          <input class="btn btn-primary" type="submit" name="submit" value="update">
         
        </form>
        </div>
        </div>
        </div>
        <?php
          if(isset($_GET['submit']))
          {
            $book_id = $_GET['book_id'];
            $Title = $_GET['Title'];
            $Publisher_Name = $_GET['Publisher_Name'];
            $Pub_year = $_GET['Pub_year'];
            $conn=mysqli_connect("localhost","root","","library database");
            $query = "UPDATE book SET Title='$Title' , Publisher_Name='$Publisher_Name', Pub_year='$Pub_year' WHERE book_id='$book_id'";
            $data = mysqli_query($conn,$query);
            echo "<script>alert('record updated')</script>";
    ?>
    <META http-equiv="Refresh" content="0; URL=http://localhost:3000/bookdetail.php">
    <?php
          }
        
         ?>
         </body>
         </html>
