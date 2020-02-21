// 入力された価格に応じて販売手数料と販売利益の計算
$(function(){
  $('#price_calc').on('input', function(){ 
    var data = $('#price_calc').val(); 
    var profit = Math.round(data * 0.9)  
    var fee = (data - profit) 
    $('.right_bar').html(fee) 
    $('.right_bar').prepend('¥') 
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(data) 
    $('#profit').val(profit)
    $('#commission').val(fee)
    if(profit == '') {   
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
})