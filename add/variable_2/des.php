<?php 
$username=$_POST["username"];
$userpass=$_POST["userpass"];
$bdname=$_POST["bdname"];
$tlname=$_POST["tlname"];
$var1=$_POST["var1"];
$var2=$_POST["var2"];
If (unlink('script2.sh')) 
{
  // file was successfully deleted
 
$file = fopen("script2.sh", "w");

fwrite($file, "#!/bin/bash" . PHP_EOL);

fwrite($file, "sudo docker exec autolamp  mysql -uroot -e \"CREATE USER '$username'@'localhost' IDENTIFIED BY '$userpass';\"" . PHP_EOL);

fwrite($file, "sudo docker exec autolamp  mysql -uroot -e \"GRANT ALL PRIVILEGES ON *.* TO '$username'@'localhost';\"" . PHP_EOL);

fwrite($file, "sudo docker exec autolamp  mysql -uroot -e \"create database $bdname\"" . PHP_EOL);

fwrite($file, "sudo docker exec autolamp  mysql -uroot -e \"use $bdname; CREATE TABLE $tlname (\"id\" int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,  $var1 varchar(70) COLLATE utf8mb4_spanish_ci NOT NULL,  $var2 varchar(70) COLLATE utf8mb4_spanish_ci NOT NULL,  \"fecha\" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP);\"" . PHP_EOL);

fwrite($file, "echo \"El nombre para el usuario es: $username\"" . PHP_EOL);

fwrite($file, "echo \"La contraseña para el usuario es: $userpass\"" . PHP_EOL);

fwrite($file, "echo \"El nombre para la base de datos es: $bdname\"" . PHP_EOL);

fwrite($file, "echo \"El nombre para la tabla es: $tlname\"" . PHP_EOL);

fwrite($file, "echo \"El nombre de la variable 1 es : $var1\"" . PHP_EOL);

fwrite($file, "echo \"El nombre de la variable 2 es : $var2\"" . PHP_EOL);

fwrite($file, "echo \"Puede entrar a PHPMYADMIN para ver la estructura y canmbiar la configuracion de la base de datos desde el siguiente enlace: http://localhost/phpmyadmin/\"" . PHP_EOL);

fclose($file);

header("Content-disposition: attachment; filename=script1.sh");
readfile("script2.sh");

}
else {
  echo "Hubo un error";
}

?>
