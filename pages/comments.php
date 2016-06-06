<?php
header("Content-type:text/html;charset=utf-8");
session_start();
include("conn.php");
$userid = $_GET['userid'];
$medid = $_GET['medid'];
$com = $_POST['comments'];
echo $userid."  ".$medid."<br />";
echo $userid."<br />";
echo $medid."<br />";

if(!isset($_SESSION["user_name"]))
{
	//echo $_SESSION['user_name'];
	echo "<script>alert('请先登录!'); history.back();</script>";
}
else{
	//echo "ssssssssss";
	echo $com;
	$sql="insert into comment (user_id, medicine_id, comments, com_time) values('".$userid."','".$medid."','".$com."','".date("Y-m-d H:i:s",time())."')";
	$res=mysqli_query($conn,$sql);
	echo "<script>history.back();</script>";
}

?>