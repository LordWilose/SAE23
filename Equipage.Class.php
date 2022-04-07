<?php

class Equipage{
	
	public function __construct($pdo){
		$this->db = $pdo;
	}

	public function getAllStudentsInfos(){
		$expression = "SELECT Nom, Prenom, IdIUT, Domicile FROM etudiant;";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$results = $sth->fetchAll(); // ['Nom'] ['Prenom']

		$values = array();

		foreach($results as $result){
			$student = array();

			$student['Nom'] = $nom = $result['Nom'];
			$student['Prenom'] = $prenom = $result['Prenom'];
			$IdIUT = $result['IdIUT'];

			$expression2 = "SELECT * FROM etablissement
							WHERE IdIUT = '$IdIUT';";
			$sth2 = $this->db->prepare($expression2);
			$sth2->execute();
			$results2 = $sth2->fetchAll()[0];

			$student['IUT'] = $results2['Nom'];
			$student['Formation'] = $results2['Formation'];
			$student['Groupe'] = $results2['Groupe'];
			$student['Sous_Groupe'] = $results2['Sous_groupe'];
			$student['Loc'] = $results2['Localisation'];
			$student['domicile'] = $result['Domicile'];

			$values[$nom] = $student;
		}

		return $values;
	}

	public function getHoraires($values){
		//fichier json
	    $filename = "horaires.json";
	    //lire le fichier json en PHP
	    $data = file_get_contents($filename);
	    //convertir texte json en array php
	    $array = json_decode($data, true);
	    $array = $array['sous_groupe'];

	    
	    $tmp = array();
	    foreach($values as $nom => $student){
	    	$tmp[$nom] = $student;
	    	//print_r($tmp[$nom]);

	    	foreach($array as $horaires){
	    		if($horaires['IUT'] == $tmp[$nom]['IUT'] && $horaires['nom'] == $tmp[$nom]['Formation']){
	    			if($horaires['annee'] == $tmp[$nom]['Groupe'] && $horaires['filiaire'] == $tmp[$nom]['Sous_Groupe']){
	    				$tmp[$nom]['horaires'] = $horaires['horaires'][0];	
	    			}
	    		}
	    	}
	    }
	    return $tmp;
	}

	public function gotCar($IdE){
		$expression = "SELECT * FROM vehicule
					   WHERE IdE = '$IdE';";
		$sth = $this->db->prepare($expression);
		$sth->execute();
		$result = $sth->fetchAll();

		if(!empty($result[0])){
			return 1;
		}else{
			return 0;
		}
	}

	public function sortByLoc($array){
		$IUTs = array();
		$domiciles = array();

		foreach($array as $nom => $student){
			$loc = $student['Loc'];
			$dom = $student['domicile'];
			
			if(!isset($IUTs[$loc])){
				$IUTs[$loc] = array();
			}
			array_push($IUTs[$loc], $nom);

			if(!isset($domiciles[$dom])){
				$domiciles[$dom] = array();
			}
			array_push($domiciles[$dom], $nom);
		}

		return array($IUTs, $domiciles);
	}

	public function setEquipages(){
		$array1 = $this->getAllStudentsInfos();
		$array2 = $this->getHoraires($array1);
		$locs = $this->sortByLoc($array2);

		
	}

}

?>