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
echo "<a href='index.php'>首页</a> "." -> "."$class_ill";
?>
  </div>

<div class="container-fluid kongge">
<div class="col-md-offset-2 col-md-2 col-lg-2 col-sm-2 col-xs-2 pic">
<?php 
  switch ($class_ill) {
    case '头颈部':
      echo "<img class='classimg' src='../img/toujing.jpg' alt='图片无法加载'>";
      break;
    case '腹部':
      echo "<img class='classimg' src='../img/fubu.jpg' alt='图片无法加载'>";
      break;
    case '腰部':
      echo "<img class='classimg' src='../img/yaobu.jpg' alt='图片无法加载'>";
      break;
    case '胸部':
      echo "<img class='classimg' src='../img/xiongbu.jpg' alt='图片无法加载'>";
      break;
    case '皮肤':
      echo "<img class='classimg' src='../img/pifu.jpg' alt='图片无法加载'>";
      break;
    case '骨骼':
      echo "<img class='classimg' src='../img/guge.jpg' alt='图片无法加载'>";
      break;
    case '其他':
      echo "<img class='classimg' src='../img/qita.jpg' alt='图片无法加载'>";
      break;
  }
  ?>


</div>
<div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 col-md-offset-1">
<?php
  $query = "select * from illness where class_organ = '".$class_ill."'";
  $result = mysqli_query($conn,$query);
  while($row = mysqli_fetch_array($result,MYSQL_BOTH))
  {
    echo "<a class='a_style' href='three.php?ill=$row[1]&class_ill=$class_ill'>$row[1]</a><br />";
  }
?>

</div>


</div>

<div class="container-fluid buwei_style ">
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="头颈部" id='头颈部' onclick="refresh1()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="胸部" id='胸部' onclick="refresh2()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="腹部" id='腹部' onclick="refresh3()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="腰部" id='腰部' onclick="refresh4()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="骨骼" id='骨骼' onclick="refresh5()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="皮肤" id='皮肤' onclick="refresh6()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input class='class_input'  type="button" value="其他" id='其他' onclick="refresh7()">
  </div>
</div>
<?php
/*echo "<script language='javascript'> alert('swtswtswt');</script>";*/
echo "<script language='javascript'> document.getElementById('".$class_ill."').style.backgroundColor = '#fff';</script>";
?>



<script src="../js/second.js"></script>

</body>
</html>