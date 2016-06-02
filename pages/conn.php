<?php
header("Content-type:text/html;charset=utf-8");
$conn = mysqli_connect("localhost","root","123456","lym"); 
  if(mysqli_connect_error())
  {
  	printf('连接数据库出错:%s\n',mysqli_connect_error());
  }
$sql="set names utf8";
mysqli_query($conn,$sql);

 ?>