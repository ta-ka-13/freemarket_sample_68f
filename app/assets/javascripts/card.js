$(function(){
  $(".card-save-btn").on("click",function(e){
    e.preventDefault();

    // XX年の入力を20XX年に書き換える
    $("#exp_year").val("20" + $("#exp_year").val());

    var card = {
      number: $("#number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };

    Payjp.createToken(card,function(status,response){
      if (status === 200) {
        $("#number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#form").append($(`<input type="hidden" name="payjpToken" class="payjp-token" />` ).val(response.id));
        $("#form").get(0).submit();
      } else {
        $(".card-save-btn").prop("disabled", false);
        alert("カード情報が正しくありません。");
      }
    });
  });

  function resetShadow() {
    $(".card-brand__image").css({
      "box-shadow":""
    });
  }

  function cardBrandShadow(cardBrand) {
    $(cardBrand).css({
      "box-shadow":"0px 0px 10px #07f",
    });
  }

  $("#number").on("keyup", function(){
    resetShadow();
    var input = $("#number").val();
    if (input.match(/^4/)) {
      cardBrandShadow(".visa")
    } else if (input.match(/^5/)) {
      cardBrandShadow(".mastercard")
    } else if (input.match(/^35/)) {
      cardBrandShadow(".jcb")
    } else if (input.match(/^34|^37/)) {
      cardBrandShadow(".americanExpress")
    } else if (input.match(/^36|^38|^39|^30/)) {
      cardBrandShadow(".dinersClub")
    } else if (input.match(/^62|^64|^65|^60/)) {
      cardBrandShadow(".discover")
    }
  });
});