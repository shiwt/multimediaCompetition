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
  <nav class="navbar nav_color" >
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

          <div class="form-group search_form">
            <input type="text" class="form-control" placeholder="Search">
          <button type="button" class="btn btn_color" >Search</button></div>
        </form>
      </div>
      <!-- /.navbar-collapse --> </div>
    <!-- /.container-fluid --> </nav>
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
            <img src="../images/first.jpg" alt="图片无法正常显示！"></div>
        </div>
      </div>
    </div>
    <!-- ***********************图片轮播结束************************* -->

    <!-- ***********************右边热度排行************************* -->
    <div class="col-md-3 bc">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
          <a href="#home" aria-controls="home" role="tab" data-toggle="tab">药品热度排行榜</a>
        </li>
        <li role="presentation">
          <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">疾病热度排行榜</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="home" >
          <tr>dajhmju</tr>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="profile">...</div>
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
                <a href="second_organ.php?class=头颈部&num=1">
                  <img src="../images/toujing.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=胸部&num=2">
                  <img src="../images/xiongbu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=腹部&num=3">
                  <img src="../images/fubu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=腰部&num=4">
                  <img src="../images/yaobu.jpg" alt="图片无法正常显示！"></a>
              </div>
            </div>
            <!-- 第二行 -->
            <div class="row">
              <div class="col-md-2">
                <a href="second_organ.php?class=骨骼&num=5">
                  <img src="../images/guge.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_organ.php?class=皮肤&num=6">
                  <img src="../images/pifu.jpg" alt="图片无法正常显示！"></a>
              </div>
              <!-- <div class="col-md-2">
                <a href="second_organ.php?class=其他">
                  <img src="../images/tuibu.jpg" alt="图片无法正常显示！"></a>
              </div> -->
              <div class="col-md-2">
                <a href="second_organ.php?class=其他&num=7">
                  <img src="../images/qita.jpg" alt="图片无法正常显示！"></a>
              </div>
            </div>
          </div>
        </div>
        <!--           系统分类          -->
        <div id="class-img2">
          <div role="tabpanel" class="tab-pane" id="profile">
            <div class="row">
              <div class="col-md-2">
                <a href="second_system.php?class=呼吸系统&num=8">
                  <img src="../images/huxi.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=循环系统&num=9">
                  <img src="../images/xunhuan.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=消化系统&num=10">
                  <img src="../images/xiaohua.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=泌尿系统&num=11">
                  <img src="../images/miniao.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=血液系统&num=12">
                  <img src="../images/xueye.jpg" alt="图片无法正常显示！"></a>
              </div>
            </div>
            <!-- 第二行 -->
            <div class="row">
              
              <div class="col-md-2">
                <a href="second_system.php?class=内分泌系统&num=13">
                  <img src="../images/neifenmi.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=代谢和营养&num=14">
                  <img src="../images/daixie.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_system.php?class=结缔组织和风湿&num=15">
                  <img src="../images/jiedi.jpg" alt="图片无法正常显示！"></a>
              </div>

              <div class="col-md-2">
                <a href="second_system.php?class=其他&num=16">
                  <img src="../images/qita.jpg" alt="图片无法正常显示！"></a>
              </div>

            </div>
          </div>
        </div>
        <!--           检诊分类          -->
        <div id="class-img3">
          <div role="tabpanel" class="tab-pane" id="messages">
            <div class="row">
              <div class="col-md-2">
                <a href="second_check.php?class=住院检诊&num=17">
                  <img src="../images/no1.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_check.php?class=传染病检诊&num=18">
                  <img src="../images/no2.jpg" alt="图片无法正常显示！"></a>
              </div>
              <div class="col-md-2">
                <a href="second_check.php?class=定点检诊&num=19">
                  <img src="../images/no3.jpg" alt="图片无法正常显示！"></a>
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

  <!--***************登录注册的模态框*************-->

  <!--                  登录               -->

  <div class="modal fade" id="dlModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="exampleModalLabel">请输入登录信息</h4>
        </div>
        <div class="modal-body">
          <form action="login.php" method="post">
            <div class="form-group">
              <label for="recipient-name" class="control-label">用户名:</label>
              <input type="text" class="form-control" id="user-name" name="username"></div>
            <div class="form-group">
              <label for="message-text" class="control-label">密码:</label>
              <input type="text" class="form-control" id="password-name" name="password"></div>
            <div class="radio">
              <label >
                <input type="radio" name="people" value="admins" >管理员</label>
              <label >
                <input type="radio" name="people" value="students">用户</label>
            </div>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button class="btn btn-primary" type="submit">登录</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!--                     注册               -->

  <div class="modal fade" id="zcModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>

          <h4 class="modal-title" id="exampleModalLabel">请输入注册信息</h4>
        </div>
        <div class="modal-body">
          <form action="regiter.php" method="post">
            <div class="form-group">
              <label for="recipient-name" class="control-label">用户名:</label>
              <input type="text" class="form-control" id="user-name" name="username"></div>
            <div class="form-group">
              <label for="message-text" class="control-label">密码:</label>
              <input type="text" class="form-control" id="password-name" name="password1"></div>
              <div class="form-group">
              <label for="message-text" class="control-label">确认密码:</label>
              <input type="text" class="form-control" id="password-name" name="password2"></div>
              <div class="form-group">
              <label for="inputEmail" class="control-label">邮箱：</label>
              <input type="email" class="form-control" id="inputEmail" name="email"></div>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">注册</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!--**************登录注册的模态框结束*************-->

  <!--  jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/class.js"></script>
</body>
</html>