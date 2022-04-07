<?php

class Request {

	public function __construct($pdo){
		$this->db = $pdo;
	}
	
	public function getIdFormation($nom, $formation, $groupe, $sous_groupe){
		$expression = "SELECT IdIUT FROM etablissement 
					   WHERE Nom='$nom' AND Formation='$formation'
					   AND Groupe='$groupe' AND Sous_groupe='$sous_groupe';";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetch()[0];

		return $result;
	}

	public function getIdStudent($name, $firstname){
		$expression = "SELECT IdE FROM etudiant WHERE nom='$name' AND prenom='$firstname';";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetch()[0];

		return $result;
	}

	public function addCar($immatriculation, $type, $marque, $modele, $places, $IdE, $En_regle){
		if((int)$places > 9){
			echo "Erreur, trop de places...mdr";
			die;
		}

		$expression = "INSERT INTO vehicule (Immatriculation, IdE, Type, Marque, Modele, Places, En_regle)
					   VALUES ('$immatriculation', '$IdE', '$type', '$marque', '$modele', '$places', '$En_regle');";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetch();
	}

	public function addPapers($immatriculation, $cg, $ct, $assurance, $permis, $points_permis){
		$expression = "INSERT INTO papiers (Immatriculation, Carte_Grise, Controle_Technique, Assurance, Permis, Points_Permis) VALUES ('$immatriculation', '$cg', '$ct', '$assurance', '$permis', '$points_permis');";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetch();
	}

	public function papersAreInLaw($immatriculation){
		$expression = "SELECT Carte_Grise, Controle_Technique, Assurance, Permis, Points_Permis
					   FROM papiers WHERE Immatriculation = '$immatriculation';";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$results = $sth->fetchAll();

		$ok = 1;

		foreach($results as $key=>$value){
			if($value < 1){
				$ok = 0;
			}
		}

		$expression2 = "UPDATE vehicule SET En_regle = '$ok'
						WHERE Immatriculation = '$immatriculation';";
		$sth2 = $this->db->prepare($expression2);
		$sth2->execute();
		$result = $sth2->fetch();

		return $ok;
	}

	public function addStudent($name, $firstname, $domicile, $IUT, $formation, $groupe, $sous_groupe, $immatriculation, $type, $marque, $modele, $cg, $ct, $assurance, $permis, $point_permis, $places){
		$IdIUT = $this->getIdFormation($IUT, $formation, $groupe, $sous_groupe);

		$expression = "INSERT INTO etudiant (IdIUT, Nom, Prenom, Domicile) VALUES ('$IdIUT', '$name', '$firstname', '$domicile');";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetch();

		$expression2 = "SELECT IdE FROM etudiant
						WHERE Nom = '$name' AND Prenom = '$firstname';";
		$sth2 = $this->db->prepare($expression2);
		$sth2->execute();
		$IdE = $sth2->fetch()[0];

	 	$this->addPapers($immatriculation, $cg, $ct, $assurance, $permis, $point_permis);
	 	$this->addCar($immatriculation, $type, $marque, $modele, $places, $IdE, "0");
	 	$this->papersAreInLaw($immatriculation);
	}
}

?>