<?php
//header("Content-type:text/html;charset=utf-8");
session_start();
$username = $_POST['username'];
$pwd= $_POST['password'];
//$people = $_POST['people'];

/*if(empty(trim($username))||empty(trim($pwd))){
  echo "用户名或者密码不能为空！";
}*/
if($username==""||$pwd=="")
{
  echo "<script language='javascript'> alert('用户名或者密码不能为空!');history.back();</script>";
}
else{
//$_SESSION["user_name"]=$username;
include("conn.php");

/*if($people=='admins'){
  echo "4<br />";
  $sql="select admin_name,password from admin where admin_name='$username'";
  $rs=mysqli_query($conn,$sql);
  if($rs){
    $row = mysqli_fetch_assoc($rs);
    if($row['password']==$pwd){
      $_SESSION["user_name"]=$username;
      echo "<script> history.back();</script>";
    }
    else{
      echo "<script language='javascript'> alert('密码错误！请重新登录');</script>";
    }
  }
  else{
    echo "<script language='javascript'> alert('用户名不存在!');</script>";
  }
}*/
/*if($people=='students'){*/
  $sql="select * from user where user_name='".$username."'";
  $rs=mysqli_query($conn,$sql);
  //if($rs){
    $row = mysqli_fetch_assoc($rs);
    if($row['user_name']=="")
    {
      echo "<script language='javascript'> alert('用户名不存在!');history.back();</script>";
    }
    else
    {
      if($row['password']==$pwd){
        $_SESSION["user_name"]=$username;
        echo "<script> history.back();</script>";
      }
      else{
        echo "<script language='javascript'>alert('密码错误！请重新登录'); history.back();</script>";
      }
    }
  //}
  /*else{
    echo "<script language='javascript'> alert('用户名不存在!');history.back();</script>";
  }*/
//}
/*echo "<script> history.back();</script>";*/
}


  /*echo '1';*/
  // if(isset($_REQUEST['authcode']))
  // {
    /*echo "2";*/
        //strtolower()小写函数
        // if(strtolower($_REQUEST['authcode'])== $_SESSION['authcode'])
        // {
            //跳转页面
            /*echo "3";*/
        //     header("location:index.php");
        // }
        // else
        // {
          /*echo "4";*/
            //提示以及跳转页面
        //     echo "<script language='javascript'> alert('输入错误!!');</script>";
        // }
        /*echo "5";*/
        /*mysqli_free_result($result);
        mysqli_close($conn)
        //exit();*/
  // }
?>