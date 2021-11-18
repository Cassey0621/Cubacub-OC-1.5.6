<?php
error_reporting(E_ALL | E_PARSE);
ini_set('display_errors', '1');
include('config.php');

$mysqli = new MySQLi($DB_host,$DB_user,$DB_pass,$DB_name);
if ($mysqli->connect_error) {
    die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}

$data = '';
#Active Banners
$prod1_active = "is_product=1 AND is_active=1 AND hg1_banner > 0";
$prod2_active = "is_product=2 AND is_active=1 AND hg2_banner > 0";
$prod3_active = "is_product=3 AND is_active=1 AND hg3_banner > 0";
$prod4_active = "is_product=1 AND is_active=1 AND hg1_banner > 0";
$prod5_active = "is_product=2 AND is_active=1 AND hg2_banner > 0";
$prod6_active = "is_product=3 AND is_active=1 AND hg3_banner > 0";

$query = $mysqli->query("SELECT * FROM users
WHERE ".$prod1_active." OR ".$prod2_active." OR ".$prod3_active." OR ".$prod4_active." OR ".$prod5_active." OR ".$prod6_active." ORDER by admin DESC");
if($query->num_rows > 0)
{
	while($row = $query->fetch_assoc())
	{
		$data .= '';
		$statistic = $row['statistics'];
		$prodid = $row['getproductid'];
		$data .= $statistic&$prodid .PHP_EOL;
	}
}
$location = '/controller/module/featured.php';
$fp = fopen($location, 'w');
fwrite($fp, $data) or die("Unable to open file!");
fclose($fp);

$query2 = $mysqli->query("SELECT * FROM users 
WHERE ".$is_validated." OR ".$is_activate." OR ".$suspend."
");
if($query2->num_rows > 0)
{
	while($row2 = $query2->fetch_assoc())
	{
		$data2 .= '';
		$toadd = $row2['user_name'];	
		$data2 .= 'admin '.$toadd.''.PHP_EOL;
	}
}
$location2 = '/controller/catalog/product.php';
$fps = fopen($location2, 'w');
fwrite($fps, $data2) or die("Unable to Update Product!");
fclose($fps);

$mysqli->close();
?>
1