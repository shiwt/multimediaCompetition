<?php 
	$sql="select ill_name from illness order by clicknum desc limit 5;";
	$rs = mysqli_query($conn,$sql);
	while($row = mysqli_fetch_assoc($rs)){
		echo "<a class='chart_ill' href='three.php?ill=".$row['ill_name']."'>".$row['ill_name']."</a><br/>";
	}
 ?>

