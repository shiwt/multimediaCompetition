<?php
//header("Content-type:text/html;charset=utf-8");
session_start();
include 'conn.php';

$class_ill = $_GET['class'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/second.css">
</head>
<body>
	 <!-- ***********************页面头部导航条** *********************** -->
  <?php 
  if(!isset($_SESSION['user_name']))
    include 'header.php';
  else
    include("header_after.php");
    ?>
<!-- ***********************页面头部导航条结束 *********************** -->

<div class="container-fluid breadcrumb">
<?php
  echo "<a href='index.php'>首页</a>"." -> "."$class_ill";
?>
  </div>

<div class="container-fluid kongge">
<div class="col-md-offset-1 col-md-4 col-lg-4 col-sm-4 col-xs-4 pic">
<?php 
  switch ($class_ill) {
    case '定点检诊':
      echo "<img class='classimg' src='../img/no3.jpg' alt='图片无法加载'>";
      break;
    case '传染病检诊':
      echo "<img class='classimg' src='../img/no2.jpg' alt='图片无法加载'>";
      break;
    case '住院检诊':
      echo "<img class='classimg' src='../img/no1.jpg' alt='图片无法加载'>";
      break;
    
  }
  ?>

</div>

<div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 col-md-offset-1">
<?php

  $query = "select * from illness where class_check = '".$class_ill."'";
  $result = mysqli_query($conn,$query);
  while($row = mysqli_fetch_array($result,MYSQL_BOTH))
  {
    echo "<a class='a_style' href='three.php?ill=$row[1]&class_ill=$class_ill'>$row[1]</a><br />";
  }
?>

</div>


</div>
<!-- col-lg- col-sm- col-xs- -->
<div class="container-fluid buwei_style ">
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input' type="button" value="住院检诊" id='住院检诊' onclick="refresh17()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="传染病检诊" id='传染病检诊' onclick="refresh18()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="定点检诊" id='定点检诊' onclick="refresh19()">
  </div>
  
</div>
<?php
/*echo "<script language='javascript'> alert('swtswtswt');</script>";*/
echo "<script language='javascript'> document.getElementById('".$class_ill."').style.backgroundColor = '#fff';</script>";
?>



<script src="../js/second.js"></script>

</body>
</html>