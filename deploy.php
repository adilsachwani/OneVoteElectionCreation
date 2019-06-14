<?php

session_start();
if(isset($_SESSION['election_id']) && isset($_SESSION['total_voters'])){
  $election_id = $_SESSION['election_id'];
  $total_voters = $_SESSION['total_voters'];
}

?>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <title>OneVote - Create Election</title>

  <link rel="icon" href="img/icon.png">

</head>

<body>

  <div class="container-fluid">
    <div class="row">

      <div class="col-md-3"></div>
      
      <div class="col-md-6"><br>

        <br><br><br>
        <p style="text-align: center"><img src="img/logo.png" class="center-block"></p><br>

        <h2 id="promptElection" style="text-align: center">Do you really want to deploy the election?</h2>
        <h2 id="congratulations" class="text-success" style="text-align: center"></h2><br>
        <p id="transaction" style="text-align: center" class="transactionText"></p>
        
        <div id="buttons">
          <button type="submit" class="btn btn-primary btn-lg btn-block btn btn-success" onclick="userActionSubmit()">Yes</button>
          <button type="submit" class="btn btn-primary btn-lg btn-block btn btn-danger" onclick="userActionCancel()">No</button>
        </div>

        </div>

      </div>

      <div class="col-md-3"></div>

    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>


<script>

  const userActionSubmit = async () => {
      
      document.getElementById("buttons").style.display = "none";
      document.getElementById("promptElection").style.display = "none";

      var election_id = "<?php echo $election_id; ?>";
      
      var link = "http://localhost:3002/deploy_contract/" + election_id;

      const response = await fetch(link);
      const myJson = await response.json();
      console.log(myJson);
      document.getElementById("congratulations").innerHTML = "Congratulations your Election is deployed!";
      document.getElementById("transaction").innerHTML = "<kbd>" + myJson.transaction_hash + "</kbd>"
  
  }  

  const userActionCancel = async() => {
    
    window.location = 'http://localhost:81/onevote/index.php';
  
  }

</script>