<!DOCTYPE html>
<html>
	<head></head>
	<body>
		<?php
			require_once('DB.Class.php');
		    $database = new DB;
		    $db = $database->connexion();

		    require_once('Equipage.Class.php');
		    $requests = new Equipage($db);
		    $array = $requests->setEquipages();
		?>
	</body>
</html>