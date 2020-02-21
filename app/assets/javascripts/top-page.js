$(function(){
  
  $(".sift-category").on("click", function(e){
    e.preventDefault();
    var href = $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("body, html").animate({ scrollTop: position }, 400);
  });
});