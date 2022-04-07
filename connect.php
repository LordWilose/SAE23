<?php
    
	$nom = $_GET['nom'];
	$prenom = $_GET['prenom'];

	require_once('DB.Class.php');
    $database = new DB;
    $db = $database->connexion();
    
    $expression = "SELECT * FROM etudiant
    			   WHERE Nom = '$nom' AND Prenom = '$prenom';";
    $sth = $db->prepare($expression);
    $sth->execute();
    $result = $sth->fetchAll();


    if(!empty($result)){
        session_start();
        $_SESSION['nom'] = $nom;
        $_SESSION['prenom'] = $prenom;
    	echo "<script>window.location.replace('Equipage.php');</script>";
    }else{
    	echo "<script>alert('Veuillez vous inscrire avant !');</script>";
    	echo "<script>window.location.replace('subscribe.html');</script>";
    }

?>