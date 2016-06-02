
var class_img1 = document.getElementById('class-img1'),
	class_img2 = document.getElementById('class-img2'),
	class_img3 = document.getElementById('class-img3');

function qiguan() {
	class_img1.style.display = "";
	class_img2.style.display = "none";
	class_img3.style.display = "none";
}

function xitong(){
	class_img1.style.display = "none";
	class_img2.style.display = "";
	class_img3.style.display = "none";

}

function jianzhen(){
	class_img1.style.display = "none";
	class_img2.style.display = "none";
	class_img3.style.display = "";
}
function hide(){
	class_img2.style.display = "none";
	class_img3.style.display = "none";
}
hide();