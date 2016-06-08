<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/search.css" rel="stylesheet"></head>
<body>
	<?php include("header.php"); ?>
	<div class="container-fluid search_r">
		<p class="style">疾病查询结果</p>
		<hr>
	</div>

<?php 
$search=$_POST['search'];
$conn = mysqli_connect("localhost","root","123456","lym"); 
  if(mysqli_connect_error())
  {
  	printf('连接数据库出错:%s\n',mysqli_connect_error());
  }
$sql="set names utf8";
mysqli_query($conn,$sql);

$sql="select ill_name from illness where ill_name like '%$search%' or ill_vulgo like '%$search%' or keyword like '%$search%' or clinicdepart like '%$search%' or class_organ like '%$search%' or class_system like '%$search%' or class_check like '%$search%';";
$rs=mysqli_query($conn,$sql);
while($row = mysqli_fetch_assoc($rs))
echo "<a class='search_style' href='three.php?ill=".$row['ill_name']."'>".$row['ill_name']."</a><br />";
?>
<div class="container-fluid search_r">
		<p class="style">药品查询结果</p>
		<hr>
	</div>
	<?php  
$sql="select medicine_name from medicine where medicine_name like '%$search%' or medicine_vulgo like '%$search%' or type like '%$search%' or approvalnumber like '%$search%' or manufacturer like '%$search%' or referenceprice like '%$search%';";
$result=mysqli_query($conn,$sql);
while($row = mysqli_fetch_assoc($result))
echo "<a class='search_style' href='four.php?med=".$row['medicine_name']."'>".$row['medicine_name']."</a><br />";
?>

</body>
</html>