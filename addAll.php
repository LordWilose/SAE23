<?php
    $name = $_POST['name'];
    $firstname = $_POST['firstname'];
    $domicile = $_POST['domicile'];
    $IUT = $_POST['nom_etablissement'];
    $formation = $_POST['formation'];
    $groupe = $_POST['groupe'];
    $sous_groupe = $_POST['sous_groupe'];
    $immatriculation = $_POST['immatriculation'];
    $type = $_POST['type'];
    $marque = $_POST['marque'];
    $modele = $_POST['modele'];
    $cg = $_POST['cg'];
    $ct = $_POST['ct'];
    $assurance = $_POST['assurance'];
    $permis = $_POST['permis'];
    $point_permis = $_POST['point_permis'];
    $places = $_POST['place'];

    require_once('DB.Class.php');
    $database = new DB;
    $db = $database->connexion();

    require_once('AddUser.Class.php');
    $requests = new AddUser($db);
    $requests->addStudent($name, $firstname, $domicile, $IUT, $formation, $groupe, $sous_groupe, $immatriculation, $type, $marque, $modele, $cg, $ct, $assurance, $permis, $point_permis, $places);

    
?>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <script>
            window.location.replace("Equipage.php");
        </script>
    </body>
</html>