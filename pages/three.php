<?php
header("Content-type:text/html;charset=utf-8");
session_start();
include 'conn.php';
$ill = $_GET['ill'];

if(isset($_GET['class_ill']))
  $class_ill = $_GET['class_ill'];

$sql="update illness set clicknum = clicknum + 1 where ill_name = '$ill'";
$rs=mysqli_query($conn,$sql);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/three.css">
</head>
<body>
	 <!-- ***********************页面头部导航条** *********************** -->
   <?php 
  if(!isset($_SESSION['user_name']))
    include 'header.php';
  else
    include("header_after.php");
    ?>
  <!-- ***********************页面头部导航条结束************************* -->
<div class="container-fluid breadcrumb">
<?php
if(!isset($_GET['class_ill']))
  echo "<a href='index.php'>首页</a>"." -> "."$ill";
else{
  switch ($class_ill) {
    case '头颈部':
    case '胸部':
    case '腰部':
    case '腹部':
    case '骨骼':
    case '皮肤':
    case '其他':
      echo "<a href='index.php'>首页</a>"." -> "."<a href='second_organ.php?class=$class_ill'>$class_ill</a>"." -> "."$ill";
      break;
    case "呼吸系统": 
    case "循环系统": 
    case "消化系统":
    case "泌尿系统":
    case "血液系统":
    case "内分泌系统":
    case "代谢和营养":
    case "结缔组织和风湿":
    case "其他":
      echo "<a href='index.php'>首页</a>"." -> "."<a href='second_system.php?class=$class_ill'>$class_ill</a>"." -> "."$ill";
      break;
    case '住院检诊':
    case '传染病检诊':
    case '定点检诊':
      echo "<a href='index.php'>首页</a>"." -> "."<a href='second_system.php?class=$class_ill'>$class_ill</a>"." -> "."$ill";
      break;
  }
}
?>
  </div>

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../js/bootstrap.min.js"></script>
<!-- ***********************页面头部导航条结束 *********************** -->
<!-- <?php
//echo "$ill"."<br />";
?> -->

<div class="container-fluid">
<p class="font"><?php echo $ill ?></p>
</div>

<div class="container-fluid">
  <div class="col-md-3">
  <?php 
    $mysql = "select * from illness where ill_name='$ill'";
    $myresult = mysqli_query($conn,$mysql);
    $sqlill = mysqli_fetch_array($myresult,MYSQLI_BOTH);
  echo "<img class='illimg' src='../img/".$sqlill['illness_img']."' alt='图片无法加载'>"; 
  ?>
    
  </div>
  <div class="col-md-2 ">
    <div class="class-btn ">
        <button class="btn btnn typeface" onclick="introduction_fun()" id="introduction">简介</button>
      </div>
      <div class="class-btn">
        <button class="btn btnn typeface" onclick="cause_fun()" id="cause">病理</button>
      </div>
      <div class="class-btn">
        <button class="btn btnn typeface" onclick="symptoms_fun()" id="symptoms">症状</button>
      </div>
      <div class="class-btn">
        <button class="btn btnn typeface" onclick="checkway_fun()" id="checkway">诊断</button>
      </div>
  </div>
  <div class="col-md-7">
    <div id="introduction_div" class="typeface">
    <?php
    echo file_get_contents($sqlill['introduction']);
    ?></div>
    <div id="cause_div" class="typeface">
    <?php
    echo file_get_contents($sqlill['cause']);
    ?></div>
    <div id="symptoms_div" class="typeface">
    <?php
    echo file_get_contents($sqlill['symptoms']);
    ?></div>
    <div id="checkway_div" class="typeface">
    <?php
    echo file_get_contents($sqlill['checkway']);
    ?></div>

  </div>
  
</div>


<div class="container-fluid">
<p class="font">用药</p>
</div>

<div class="container-fluid">
<div class="med">
<?php

$query = "select medicine_id from link where ill_id = (select id from illness where ill_name = '$ill')";
$result = mysqli_query($conn,$query);
  while($row = mysqli_fetch_array($result,MYSQLI_BOTH))
  {
    $s= "select * from medicine where id = ".$row['medicine_id'];
    $r=mysqli_query($conn,$s);
    $rd = mysqli_fetch_array($r,MYSQLI_BOTH);
    if(isset($_GET['class_ill'])){
    
    echo "<div class='col-md-2  med_mar'><div><a href='four.php?med=".$rd['medicine_name']."&ill=$ill&class_ill=$class_ill'> <img class='med_img' src='".$rd['medicine_img']."' alt='图片无法加载'><p class='typeface'>".$rd['medicine_name']."</p></a></div></div>";}
    else{
        echo "<div class='col-md-2  med_mar'><div><a href='four.php?med=".$rd['medicine_name']."&ill=$ill'> <img class='med_img' src='".$rd['medicine_img']."' alt='图片无法加载'><p class='typeface'>".$rd['medicine_name']."</p></a></div></div>";
    }
  }
?>
</div>
</div>

<script src="../js/three.js"></script>
</body>
</html>