<?php
//Localhost DB 
// $conn = mysqli_connect('localhost','sunny','Gautham@28','ehr2');

$conn = mysqli_connect('localhost','root','root','ehr');

//Older DB 
//$conn = mysqli_connect('dallas142','jtrust08_ehr2711','Ehr@123','jtrust08_ehr_2711');

//New DB From 20jan 2019
//$conn = mysqli_connect('dallas142','jtrust08_ehr_20','EHR20JAN','jtrust08_ehr20jan');



//Root folder to refer all the files within
$_SESSION['root']="/uat16/";//"/ehr/uat9/"
//$_SESSION['root']="/ehr/uat17/"
//define(root_path, dirname(__FILE__), true);
//echo  $_SERVER['DOCUMENT_ROOT'] ;
?>
