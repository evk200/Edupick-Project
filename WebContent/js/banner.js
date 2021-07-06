var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 3000); // Change image every 2 seconds
}

$(document).ready(function(){
	$("#movebanner").click(function(){
		$(".imgbanner").css("display","none");
		$(".imgbanner3").css("display","block");
	});
	$("#movebanner2").click(function(){
		$(".imgbanner").css("display","none");
		$(".imgbanner2").css("display","block");
	});
	$("#movebanner3").click(function(){
		$(".imgbanner2").css("display","none");
		$(".imgbanner").css("display","block");
	});
	$("#movebanner4").click(function(){
		$(".imgbanner2").css("display","none");
		$(".imgbanner3").css("display","block");
	});
	$("#movebanner5").click(function(){
		$(".imgbanner3").css("display","none");
		$(".imgbanner2").css("display","block");
	});
	$("#movebanner6").click(function(){
		$(".imgbanner3").css("display","none");
		$(".imgbanner").css("display","block");
	});
});