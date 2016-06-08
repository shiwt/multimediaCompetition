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
<div class="col-md-offset-2 col-md-2 col-lg-2 col-sm-2 col-xs-2 pic">
<?php 
  switch ($class_ill) {
    case '呼吸系统':
      echo "<img class='classimg' src='../img/huxi.jpg' alt='图片无法加载'>";
      break;
    case '循环系统':
      echo "<img class='classimg' src='../img/xunhuan.jpg' alt='图片无法加载'>";
      break;
    case '消化系统':
      echo "<img class='classimg' src='../img/xiaohua.jpg' alt='图片无法加载'>";
      break;
    case '血液系统':
      echo "<img class='classimg' src='../img/xueye.jpg' alt='图片无法加载'>";
      break;
    case '内分泌系统':
      echo "<img class='classimg' src='../img/neifenmi.jpg' alt='图片无法加载'>";
      break;
    case '泌尿系统':
      echo "<img class='classimg' src='../img/miniao.jpg' alt='图片无法加载'>";
      break;
    case '代谢和营养':
      echo "<img class='classimg' src='../img/daixie.jpg' alt='图片无法加载'>";
      break;
    case '结缔组织和风湿':
      echo "<img class='classimg' src='../img/jiedi.jpg' alt='图片无法加载'>";
      break;
    case '其他':
      echo "<img class='classimg' src='../img/qita.jpg' alt='图片无法加载'>";
      break;
  }
  ?>

</div>

<div class="col-md-5  col-lg-5 col-sm-5 col-xs-5 col-md-offset-1">
<?php
  $query = "select * from illness where class_system = '".$class_ill."'";
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
    <input  class='class_input' type="button" value="呼吸系统" id='呼吸系统' onclick="refresh8()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="循环系统" id='循环系统' onclick="refresh9()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="消化系统" id='消化系统' onclick="refresh10()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="泌尿系统" id='泌尿系统' onclick="refresh11()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="血液系统" id='血液系统' onclick="refresh12()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="内分泌系统" id='内分泌系统' onclick="refresh13()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="代谢和营养" id='代谢和营养' onclick="refresh14()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="结缔和风湿" id='结缔和风湿' onclick="refresh15()">
  </div>
  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1">
    <input  class='class_input' type="button" value="其他" id='其他1' onclick="refresh16()">
  </div>
</div>
<?php
/*echo "<script language='javascript'> alert('swtswtswt');</script>";*/
echo "<script language='javascript'> document.getElementById('".$class_ill."').style.backgroundColor = '#fff';</script>";
?>



<script src="../js/second.js"></script>

</body>
</html>