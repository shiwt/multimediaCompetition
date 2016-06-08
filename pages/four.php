<?php
//header("Content-type:text/html;charset=utf-8");
session_start();
include("conn.php");
if(isset($_GET['ill']))
  $ill = $_GET['ill'];

if(isset($_GET['class_ill']))
  $class_ill = $_GET['class_ill'];
$med = $_GET['med'];
/*点击药品,增加1*/
$sql="update medicine set clicknum = clicknum + 1 where medicine_name = '$med'";
$rss=mysqli_query($conn,$sql);

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
  <link href="../css/index.css" rel="stylesheet" >
  <link href="../css/four.css" rel="stylesheet" ></head>
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
    if(!isset($_GET['ill']))
  echo "<a href='index.php'>首页</a>
  "." -> "."$med";
else{
  if(!isset($_GET['class_ill']))
    echo "
  <a href='index.php'>首页</a>
  "." -> "."
  <a href='three.php?ill=$ill'>$ill</a>
  "." -> "."$med";
  else{
  switch ($class_ill) {
    case '头颈部':
    case '胸部':
    case '腰部':
    case '腹部':
    case '骨骼':
    case '皮肤':
    case '其他':
      echo "
  <a href='index.php'>首页</a>
  "." -> "."
  <a href='second_organ.php?class=$class_ill'>$class_ill</a>
  "." -> "."
  <a href='three.php?class_ill=$class_ill&ill=$ill'>$ill</a>
  "." -> ".$med;
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
      echo "
  <a href='index.php'>首页</a>
  "." -> "."
  <a href='second_system.php?class=$class_ill'>$class_ill</a>
  "." -> "."
  <a href='three.php?class_ill=$class_ill&ill=$ill'>$ill</a>
  "." -> ".$med;
      break;
    case '住院检诊':
    case '传染病检诊':
    case '定点检诊':
      echo "
  <a href='index.php'>首页</a>
  "." -> "."
  <a href='second_system.php?class=$class_ill'>$class_ill</a>
  "." -> "."
  <a href='three.php?class_ill=$class_ill&ill=$ill'>$ill</a>
  "." -> ".$med;
      break;
      }
  }
}
?>
</div>
<div class="container-fluid row">
  <?php
    $sq= "select * from medicine where medicine_name = '".$med."'";
    $re=mysqli_query($conn,$sq);
    $rd = mysqli_fetch_array($re,MYSQLI_BOTH);
  ?>
  <div class="col-md-5 col-md-offset-2">
    <p class="font">概述</p>
    <table>
      <tr>
        <td>
          <span class="span1">药品名:</span>
          <?php echo $rd['medicine_name']; ?></td>
      </tr>
      <tr>
        <td>
          <span class="span1">批准文号:</span>
          <?php echo $rd['approvalnumber']; ?></td>
      </tr>
      <tr>
        <td>
          <span class="span1">是否处方药:</span>
          <?php echo $rd['type']; ?></td>
      </tr>
      <tr>
        <td>
          <span class="span1">生产厂家:</span>
          <?php echo $rd['manufacturer']; ?></td>
      </tr>
      <tr>
        <td>
          <span class="span1">参考价格:</span>
          <?php echo $rd['referenceprice']; ?></td>
      </tr>
    </table>
  </div>
  <div class="col-md-3">
    <?php    echo "<img class='med_img' src='".$rd['medicine_img']."' alt='图片无法加载'>";?></div>
</div>
<div class="col-md-6 col-md-offset-2 instruction">
  <p class="font">说明书:</p>
  <?php  
  if(!isset($_SESSION["user_name"])){
    echo "<p class='load'>登录后可下载说明书！</p>";
  }
  else{
    echo "<a class='load' href='".$rd['instruction']."' download='".$rd['medicine_name']."'>
    <span class='glyphicon glyphicon-download-alt' aria-hidden='true'></span>
  下载该说明
</a>";
  }

    
  ?>
<?php   echo "<div class='container-fluid shuoming'>". file_get_contents($rd['instruction'])."</div>";?>
</div>
<div class="col-md-8 col-md-offset-2 ">
<p class="font ">用户评价</p>
<?php 
  if(!isset($_SESSION["user_name"]))
    echo "<p class='load'>登陆后才可浏览与评价该药！</p>";
  else{
    $comsql = "select * from comment where medicine_id =".$rd['id'];
    $comre=mysqli_query($conn,$comsql);
    while($row = mysqli_fetch_array($comre,MYSQLI_BOTH))
    {
      //获取用户信息(头像)
      $sql1 = "select * from user where id = ".$row['user_id'];
      $result1 = mysqli_query($conn,$sql1);
      $row1 = mysqli_fetch_array($result1,MYSQLI_BOTH); ?>
      <div class='container-fluid commet'>
              <div class='col-md-2'>
                <img class="userimg" src="<?php echo $row1['user_img']; ?>" alt='图片无法加载'>                
              </div>
              <div class='col-md-2'>
                <p class="usern ziti"><?php echo $row1['user_name']; ?></p>
              </div>
              <div class='col-md-10'>
                  <p style="word-wrap:break-word" class="ziti"><?php echo $row['comments']; ?></p>
                  <p class="ziti"><?php echo $row['com_time']; ?></p>
              </div>
            </div>
   <?php   }

$sql2 = "select * from user where user_name = '".$_SESSION['user_name']."'";
$result2 = mysqli_query($conn,$sql2);
$rd2 = mysqli_fetch_array($result2,MYSQLI_BOTH);
echo "<form action='comments.php?userid=".$rd2['id']."&medid=".$rd['id']."' method='post'>";?>
  <p class="font ">我也说一句</p>
<textarea name="comments"></textarea>
<input type="submit" class="btn btn-primary" value="评论" />
  <?php echo "</form>"; ?>
</div>
<?php 
}
 ?>
 