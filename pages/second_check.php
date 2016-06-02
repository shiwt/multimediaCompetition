<?php
header("Content-type:text/html;charset=utf-8");
include 'conn.php';
$class_ill = $_GET['class'];
$num = $_GET['num'];
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
  <nav class="navbar nav_color" style="background-color: #81c8e9; 
	margin: 0px;
	height: 70px;">
    <div class="container-fluid">
      <div class="navbar-header">
        <!-- button是为了在页面缩小的时候右边有一个类似菜单的东西  -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
          <span class="glyphicon glyphicon-erase" aria-hidden="true"></span>
          药品检索平台
        </a>

      </div>

      <!--  导航区右边搜索框与按钮 -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <form class="navbar-form navbar-right" role="search">
          <ul class="nav navbar-nav cnzz-event" id="index-right-nav">
            <li>
              <a data-toggle="modal" data-target="#dlModal">登录</a>
            </li>
            <li class="divider">
              <a data-toggle="modal" data-target="#zcModal">注册</a>
            </li>
          </ul>

          <div class="form-group" style="margin-top: 8px;">
            <input type="text" class="form-control" placeholder="Search">
          <button type="button" class="btn btn_color" style="background-color: #019fe9;">Search</button></div>
        </form>
      </div>
      <!-- /.navbar-collapse --> </div>
    <!-- /.container-fluid --> </nav>
  <!-- ***********************页面头部导航条结束************************* -->


<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../js/bootstrap.min.js"></script>
<!-- ***********************页面头部导航条结束 *********************** -->
<div class="container-fluid">
<?php
echo "首页"." -> "."$class_ill";
?>
  </div>

<div class="container-fluid">
<div class="col-md-3 pic">
<img src="../images/guge.jpg" alt="图片无法加载">

</div>

<div class="col-md-6">
<?php

  $query = "select * from illness where class_organ = '".$class_ill."'";
  $result = mysqli_query($conn,$query);
  while($row = mysqli_fetch_array($result,MYSQL_BOTH))
  {
    echo "<a class='a_style' href=''>$row[1]</a><br />";
  }
?>

</div>


</div>

<div class="container-fluid">
  <div class="col-md-1">
    <input type="button" value="住院检诊" id='17' onclick="refresh17()">
  </div>
  <div class="col-md-1">
    <input type="button" value="传染病检诊" id='18' onclick="refresh18()">
  </div>
  <div class="col-md-1">
    <input type="button" value="定点检诊" id='19' onclick="refresh19()">
  </div>
  
</div>
<?php
/*echo "<script language='javascript'> alert('swtswtswt');</script>";*/
echo "<script language='javascript'> document.getElementById('".$num."').style.backgroundColor = '#fff';</script>";
?>



<script src="../js/second.js"></script>

</body>
</html>