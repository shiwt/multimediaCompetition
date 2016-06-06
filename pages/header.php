<?php $_SESSION['check']=0;include 'model.html'; ?>
<link rel="stylesheet" href="../css/header.css">
<!-- ***********************页面头部导航条** *********************** -->
  <nav class="navbar nav_color">
    <div class="container-fluid ">
      <div class="navbar-header">
        <!-- button是为了在页面缩小的时候右边有一个类似菜单的东西  -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.php">
          <span class="glyphicon glyphicon-erase" aria-hidden="true"></span>
          药品检索平台
        </a>

      </div>

      <!--  导航区右边搜索框与按钮 -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <form class="navbar-form navbar-right" role="search" action="search.php" method="post">
          <ul class="nav navbar-nav cnzz-event" id="index-right-nav">
            <li>
              <a data-toggle="modal" data-target="#dlModal">登录</a>
            </li>
            <li class="divider">
              <a data-toggle="modal" data-target="#zcModal">注册</a>
            </li>
          </ul>

          <div class="form-group" style="margin-top: 8px;">
            <input type="text" class="form-control" placeholder="Search" name="search">
          <button type="submit" class="btn btn_color ">查询</button></div>
        </form>
      </div>
      <!-- /.navbar-collapse --> </div>
    <!-- /.container-fluid --> </nav>
  <!-- ***********************页面头部导航条结束************************* -->
  <!--  jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../js/bootstrap.min.js"></script>