$(function () {
  function scroll(num) {
    $("html, body").animate({ scrollTop: num }, 400);
  }

  $(".perent-sift__list").on("click", function(e){
    e.preventDefault();
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? "html" : href);
    var position = target.offset().top;
    scroll(position);
  });

  $(window).scroll(function(){
    if ($(this).scrollTop() > 800) {
      $(".category-scroll").fadeIn(300);
    } else {
      $(".category-scroll").fadeOut(300);
    }
  });

  $(".category-scroll").on("click", function(e){
    e.preventDefault();
    scroll(0);
  });
});