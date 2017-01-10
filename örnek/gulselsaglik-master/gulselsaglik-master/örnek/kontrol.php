<?php
require("connection.php");
$eposta=$_POST["inputEmail"];
$sifre=$_POST["inputSifre"];
$sorgula=mysqli_query($baglan,"INSERT INTO kullanicilar(username,password) VALUES ('".$eposta."','".$sifre."')");
if($sorgula===TRUE){
	
	echo "Kayıt Başarıyla Eklendi";
}
else{
	echo "Hata";
	
}
?>