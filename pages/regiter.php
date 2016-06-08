<?php
//header("Content-type:text/html;charset=utf-8");
session_start();
include("conn.php");
$user_name = $_POST['username'];
$pd1 = $_POST['password1'];
$pd2 = $_POST['password2'];
$email = $_POST['email'];
$image="../img/head/0.png";
/*$like = $_POST['like'];*/
/*echo "1";*//**/
if($pd1 == "")
	echo "<script language='javascript'> alert('密码不能为空!请重新注册');history.back();
	 </script>";
else{
	if ($pd1 == $pd2) {
		$query_bef = "select user_name from user where user_name = '$user_name'";
		$result_bef = mysqli_query($conn,$query_bef);
		$row = mysqli_fetch_array($result_bef);
		if($row)
		{
			echo "<script language='javascript'> alert('用户名已被注册,请重新输入!');history.back();
		 </script>";
		exit();
		}
		else
		{
		
		//echo "$user_name<br>$pd2<br>$email<br>$like<br>";
		$query = "INSERT INTO `lym`.`user` (`user_name`, `password`, `email`, `user_img`, `flag`) values('$user_name','$pd2','$email','$image',1)";
		$result = mysqli_query($conn,$query);
		//echo $result ? '插入成功' : '插入失败，Mysql错误是：' . mysql_error();
		if ($result) {
			echo "<script language='javascript'> alert('注册成功请登录!');
		history.back(); </script>";
			//header("location:../login.php");
		}
}
	}
else{
	echo "<script language='javascript'> alert('两次输入密码不一样!') 
	history.back(); </script>";
	/*echo "<script language='javascript'>";
    echo "alert('两次输入密码不一样!')";
    echo "document.location='../regiter.html'";
    echo "</script>";*/
}
}
  exit();

?>