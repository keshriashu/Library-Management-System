<?php
require_once('database.php');

   $_GET["book_id"]; 
   $_GET["book_name"]; 
   $_GET["author_name"];  

?>
<!DOCTYPE html>
<html>
    <head>
        <title>
            book_author entry
        </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    
        <link rel="stylesheet" href="css/signup.css">
    </head>
    
    

    <body>
        
        <div class="container">
        <div class="row">
        <div class="col-sm-3">

      <center> <h1>BOOK_AUTHOR EDIT</h1></center><br><br>
        <form action="" method="GET">
        book_id <input class="form-control" type="text" name="book_id" value="<?php echo $_GET['book_id']; ?>"/><br><br>
        book_name <input class="form-control" type="text" name="book_name" value="<?php echo $_GET['book_name']; ?>"/><br><br>
        author_name <input class="form-control" type="text" name="author_name" value="<?php echo $_GET['author_name']; ?>"/><br>

          <input class="btn btn-primary" type="submit" name="submit" value="update">
         
        </form>
        </div>
        </div>
        </div>
        <?php
          if(isset($_GET['submit']))
          {
            $book_id = $_GET['book_id'];
            $book_name = $_GET['book_name'];
            $author_name = $_GET['author_name'];
            $conn=mysqli_connect("localhost","root","","library database");
            $query = "UPDATE book_author SET book_name='$book_name' , author_name='$author_name' WHERE book_id='$book_id'";
            $data = mysqli_query($conn,$query);
            echo "<script>alert('record updated')</script>";
    ?>
    <META http-equiv="Refresh" content="0; URL=http://localhost:3000/adetail.php">
    <?php
          }
        
         ?>
         </body>
         </html>
