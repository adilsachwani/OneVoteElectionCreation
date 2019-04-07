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
 
  </head>

  <body>
    <p>Do you really want to deploy the election?</p>
    <button onclick="userAction()"> Submit</button>

    <p id="transaction"></p>
  </body>


</html>



<script>
  const userAction = async () => {
      const response = await fetch('http://localhost:3002/deploy_contract');
      const myJson = await response.json();
      console.log(myJson);
      document.getElementById("transaction").innerHTML = myJson.transaction_hash;
  }    
</script>


