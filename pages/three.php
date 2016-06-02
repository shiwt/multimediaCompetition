<?php
header("Content-type:text/html;charset=utf-8");
include 'conn.php';
//$ill = $_GET['ill'];

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
  <nav class="navbar nav_color" style="background-color: #81c8e9; 
	margin: 0px;
	height: 70px;">
    <div class="container-fluid ">
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
<p class="font">高血压</p>
</div>

<div class="container-fluid">
  <div class="col-md-3">
    <img src="" alt="图片无法加载">
  </div>
  <div class="col-md-2">
    <div class="class-btn">
        <button class="btn" onclick="introduction()" id="introduction">简介</button>
      </div>
      <div class="class-btn">
        <button class="btn" onclick="cause()" id="cause">病理</button>
      </div>
      <div class="class-btn">
        <button class="btn" onclick="symptoms()" id="symptoms">症状</button>
      </div>
      <div class="class-btn">
        <button class="btn" onclick="checkway()" id="checkway">诊断</button>
      </div>
  </div>
  <div class="col-md-7">
    
    <div id="introduction_div">简介</div>
    <div id="cause_div">病理</div>
    <div id="symptoms_div">症状</div>
    <div id="checkway_div">诊断</div>

  </div>
  
</div>


<div class="container-fluid">
<p class="font">用药</p>
</div>

<script src="../js/three.js"></script>
</body>
</html>