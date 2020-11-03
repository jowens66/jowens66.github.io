<?php

if($_POST["submit"]) {
    $recipient="jesseowens777@yahoo.com";
    $subject="Form to email message";
    $sender=$_POST["sender"];
    $senderEmail=$_POST["senderEmail"];
    $message=$_POST["message"];

    $mailBody="Name: $sender\nEmail: $senderEmail\n\n$message";

    mail($recipient, $subject, $mailBody, "From: $sender <$senderEmail>");

    $thankYou="<p style='color:#33cc33;'>Thank you! $sender Your message has been sent.</p>";
}

?><!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Website made completely by a full time computer programming student">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
	
	<link rel="apple-touch-icon" sizes="57x57" href="../images/Favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="../images/Favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="../images/Favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="../images/Favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="../images/Favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="../images/Favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="../images/Favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="../images/Favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="../images/Favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="../images/Favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="../images/Favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../images/Favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="../images/Favicon/favicon-16x16.png">
	<link rel="manifest" href="../images/Favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="../images/Favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">

	<link rel="shortcut icon" href="../images/Favicon/favicon.ico" type="image/x-icon">
	<link rel="icon" href="../images/Favicon/favicon.ico" type="image/x-icon">
	
	<script>function validateForm() {
    var sender = document.forms["myForm"]["sender"].value;
    var subject = document.forms["myForm"]["subject"].value;
    var email = document.forms["myForm"]["senderEmail"].value;
    if (sender == "") {
        alert("Name must be filled out");
        return false;
    }
    if (subject == "") {
        alert("A subject must be entered");
        return false;
    }
    if (email == "") {
        alert("An email must be entered");
        return false;
    }
    }</script>
	
	<title>The Real J.O.
	</title>
</head>

<body>
<div class="container-fluid">

<h1>www.realjesseowens.com<img src="../images/The_Yellow_Sign.svg" alt="My Logo" class="center"></h1>
<h2>The Real J.O.</h2>
<header>
<!-- Navigation bar starts here -->
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<button aria-label="button" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="../index.html">Home</a></li>
				<li><a href="../subdomains/Projects.html">Projects</a></li>
				<li><a href="../subdomains/FAQ.html">FAQ</a></li>
				<li class="active"><a href="../subdomains/Contact.php">Contact</a></li>
				<li><a href="../subdomains/Resume.html">Resume</a></li>
			</ul>
		</div>
	</nav>
<!-- Navigation bar end here -->
</header>

<main>

<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-4 col-md-offset-4 formcol">
		<h3>Contact Form</h3>
		<p>Shoot me an email below with any feedback you might have, or if you wish to contact me about something employment related.</p>
		
		<?=$thankYou ?>
		
		<form name="myForm" onsubmit="return validateForm()" action="Contact.php" method="post">
			
			<label for="name">Name:</label>
			<input id="name" type="text" name="sender">
			
			<label for="subject">Subject:</label>
			<input id="subject" type="text" name="subject">
			
			<label for="email">Email address:</label>
			<input id="email" type="email" name="senderEmail">
			
			<label for="message">Message:</label>
			<textarea id="message" rows="5" cols="20" name="message"></textarea>
			
			<input aria-label="button" id="button" type="submit" name="submit">
		</form>
	</div>
	

	<div class="col-xs-12 col-sm-6 col-md-3 col2">
		<h3></h3>
		<p></p>
	</div>



	<div class="col-xs-12 col-sm-6 col-md-3 col3">
		<h3></h3>
		<p></p>
	</div>



	<div class="col-xs-12 col-sm-6 col-md-3 col4">
		<h3></h3>
		<p></p>
	</div>
</div>

</main>

<footer>
	<hr>
	<h4>&copy Jesse Owens 2019</h4>
</footer>

</div>

</body>

</html>