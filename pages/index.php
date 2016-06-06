<?php
header("Content-type:text/html;charset=utf-8");
session_start();
include("conn.php");
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>医药查询平台</title>
  <!-- Bootstrap -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/index.css" rel="stylesheet" ></head>
<body>
  <!-- ***********************页面头部导航条** *********************** -->
   <?php 
  if(!isset($_SESSION['user_name']))
    include 'header.php';
  else
    include("header_after.php");
    ?>
  <!-- ***********************页面头部导航条结束************************* -->

  <div class="row div_background">
    <!-- ***********************左边图片轮播************************* -->

    <div class="col-md-9">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        </ol>
        <!-- Wrapper for slides role="listbox-->
        <div class="carousel-inner " role="listbox" >
          <div class="item active ">
            <img class="image" src="../img/first.jpg" alt="图片无法正常显示！"></div>
        </div>
      </div>
    </div>
    <!-- ***********************图片轮播结束************************* -->

    <!-- ***********************右边热度排行************************* -->
    <div class="col-md-3 bc">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
          <a href="#home" aria-controls="home" role="tab" data-toggle="tab" class="chart">药品热度排行榜</a>
        </li>
        <li role="presentation">
          <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="chart">疾病热度排行榜</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="home" >
          <?php include("chart_medicine.php"); ?>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="profile">
         <?php include("chart_ill.php"); ?></div>
      </div>

    </div>
  </div>

  <!-- ***********************右边热度排行结束************************* -->

  <!-- ***********************下面左边分类按钮************************* -->
  <div class="container-fluid">
    <div class="col-md-4">
      <div class="class-btn">
        <button class="btn btn-info" onclick="qiguan()">器官分类</button>
      </div>
      <div class="class-btn">
        <button class="btn btn-info" onclick="xitong()">系统分类</button>
      </div>
      <div class="class-btn">
        <button class="btn btn-info" onclick="jianzhen()">检诊分类</button>
      </div>
    </div>

    <!-- ***********************下面左边分类按钮结束************************* -->

    <!-- ************************下面右边分类类别*********************** -->
    <div class="col-md-8 ">

      <!--模块中的下面的面板-->
      <div class="tab-content">

        <!--           器官分类          -->
        <div id="class-img1">
          <div role="tabpanel" class="tab-pane active" id="home">
            <div class="row">
              <div class="col-md-2">
                <a href="second_organ.php?class=头颈部">
                  <img src="../img/toujing.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=胸部">
                  <img src="../img/xiongbu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=腹部">
                  <img src="../img/fubu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=腰部">
                  <img src="../img/yaobu.jpg" alt="图片无法正常显示！"></a>
              </div>
            </div>
            <!-- 第二行 -->
            <div class="row">
              <div class="col-md-2">
                <a href="second_organ.php?class=骨骼">
                  <img src="../img/guge.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=皮肤">
                  <img src="../img/pifu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <!-- <div class="col-md-2">
              <a href="second_organ.php?class=其他">
                <img src="../tuibu.jpg" alt="图片无法正常显示！"></a>
            </div>
            -->
            <div class="col-md-2">
              <a href="second_organ.php?class=其他">
                <img src="../img/qita.jpg" alt="图片无法正常显示！"></a>
            </div>
          </div>
        </div>
      </div>
      <!--           系统分类          -->
      <div id="class-img2">
        <div role="tabpanel" class="tab-pane" id="profile">
          <div class="row">
            <div class="col-md-2">
              <a href="second_system.php?class=呼吸系统">
                <img src="../img/huxi.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=循环系统">
                <img src="../img/xunhuan.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=消化系统">
                <img src="../img/xiaohua.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=泌尿系统">
                <img src="../img/miniao.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=血液系统">
                <img src="../img/xueye.jpg" alt="图片无法正常显示！"></a>
            </div>
          </div>
          <!-- 第二行 -->
          <div class="row">

            <div class="col-md-2">
              <a href="second_system.php?class=内分泌系统">
                <img src="../img/neifenmi.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=代谢和营养">
                <img src="../img/daixie.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_system.php?class=结缔组织和风湿">
                <img src="../img/jiedi.jpg" alt="图片无法正常显示！"></a>
            </div>

            <div class="col-md-2">
              <a href="second_system.php?class=其他1">
                <img src="../img/qita.jpg" alt="图片无法正常显示！"></a>
            </div>

          </div>
        </div>
      </div>
      <!--           检诊分类          -->
      <div id="class-img3">
        <div role="tabpanel" class="tab-pane" id="messages">
          <div class="row">
            <div class="col-md-2">
              <a href="second_check.php?class=住院检诊">
                <img src="../img/no1.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_check.php?class=传染病检诊">
                <img src="../img/no2.jpg" alt="图片无法正常显示！"></a>
            </div>
            <div class="col-md-2">
              <a href="second_check.php?class=定点检诊">
                <img src="../img/no3.jpg" alt="图片无法正常显示！"></a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
<!-- **********************下面右边分类类别结束************************* -->

<!-- **********************页脚区************************* -->
<footer>
  <p class="text-center">
    <a href="#">回到顶部</a>
    |
    <a href="#">联系我们</a>
    |
    <a href="#">&copy;2016 Designed by LYM</a>
  </p>
</footer>
<!-- **********************页脚区************************* -->
<script>
  $('.image').css('height', $('.div_background').innerHeight());
  $('.bc').css('height', $('.div_background').innerHeight());

</script>
<script src="../js/class.js"></script>
</body>
</html>