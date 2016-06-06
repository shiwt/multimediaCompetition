<?php 
	$sql="select medicine_name from medicine order by clicknum desc limit 5;";
	$rs = mysqli_query($conn,$sql);
	while($row = mysqli_fetch_assoc($rs)){
		echo "<a class='chart_ill' href='four.php?med=".$row['medicine_name']."'>".$row['medicine_name']."</a><br/>";
	}
 ?>

