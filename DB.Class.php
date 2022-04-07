<?php

class DB {
	public $db;

	public function connexion() {
		try{
			$this->db = new PDO('mysql:host=localhost;dbname=sae23_covoiturage', 'root', '');
			return $this->db;
		}
		catch(PDOException $e){
			echo $e->getMessage()." Erreur, sortie...";
			die;
		}
	}
}

?>