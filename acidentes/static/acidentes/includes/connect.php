<?php
	include_once 'config.php';	
	$mysqli = new mysqli(HOST, USER, PASSWORD, DATABASE);
	
	if (!$mysqli) {
		die('Não foi possível conectar: '.mysql_error());
	}
?>