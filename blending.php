<?php
require_once('config.php');
?>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Book Lending Form
        </title>
    </head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="signup.css">

    <body>
        
        <div class="sign">
            <form action="blending.php" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                    <h3> BOOK LENDING</h3>
                
                    <hr class="nb-3">
                    <label for="book-id"><b>BOOK_Id</b></label>
                    <input class="form-control" type="text" id="book_id" name="book_id" required placeholder="enter the book-id">

                    <label for="Date-out"><b>DATE_OUT</b></label>
                    <input class="form-control" type="text" id="date_out" name="date_out" required placeholder="issue date">

                    <label for="Due-out"><b>DUE_DATE</b></label>
                    <input class="form-control" type="text" id="due_out" name="due_date" required placeholder="submit date">

                    <label for="card-no"><b>CARD_NO</b></label>
                    <input class="form-control" type="text" id="card_no" name="card_no" required placeholder="enter the card-no">

                    <hr class="nb-3">

                    <input class="btn btn-primary" type="submit" id="register" name="Create" value="SUBMIT">
                </div>
                </div>
                <center><button class="button"><a href="http://localhost:3000/viewbl.php">View Book_Lending List</a></button></center>
                </div>
            </form>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

        <script type="text/javascript">
        $(function(){
		$('#register').click(function(e){

			var valid = this.form.checkValidity();

			if(valid){

            var book_id 	= $('#book_id').val();
			var date_out	= $('#date_out').val();
			var due_date	= $('#due_out').val();
			var card_no     = $('#card_no').val();
           
            
			

				e.preventDefault();	

				$.ajax({
					type: 'POST',
					url: 'process.php',
					data: {book_id : book_id, date_out: date_out,due_date: due_date,card_no: card_no},
					success: function(data){
					Swal.fire({
								'title': 'Successful',
								'text': data,
								'type': 'success'
								}).then(ok=> {
   if (ok) {
    window.location.href = "blending.php";
  }
});
							
					},
					error: function(data){
						Swal.fire({
								'title': 'Errors',
								'text': 'There were errors while saving the data.',
								'type': 'error'
								})
					}
				});

				
			}else{
				
			}

			



		});		

		
	});
        </script>
    </body>
</html>