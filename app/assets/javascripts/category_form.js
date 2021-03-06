$(document).on('turbolinks:load', function(){

  var category = $("#category-form");

  function appendSelect(num) {
    if(num == 1) {
      var select_id = `childform`
    } else if(num==2) {
      var select_id = `grandchildform`
    }
    var html = `<select class="sell-form-pulldown" id="${select_id}" name="item[category_id]">
                  <option value>---</option>
                </select>`
    category.append(html)
  }

  function appendOption(option, num) {
    if (num == 1) {
      var appendId = $("#childform")
    }else if (num == 2) {
      var appendId = $("#grandchildform")
    }
    appendId.append(
      $("<option>")
        .val($(option).attr('id'))
        .text($(option).attr('name'))
    )
  }

  $("#parent-form").on('change',function(){
    parent_form = $(this).val();
    $("#childform, #grandchildform").remove();
    $("#brand-form").hide();
    $.ajax({
        url: '/items/search',
        type: "GET",
        data: {parent_form: parent_form},
        dataType: 'json'
      })
      .done(function(childform){
        var num = 1
        appendSelect(num)
        childform.forEach(function(childform) {
        appendOption(childform, num)
      })
    })
  })


  $(document).on('change', "#childform", function() {
    childform = $(this).val();
    $("#grandchildform").remove();
    $("#brand-form").hide();

    $.ajax({
      type: "GET",
      url: '/items/search',
      data: {childform: childform},
      dataType: 'json'
    })
    .done(function(grandchildform) {
      var num = 2
      appendSelect(num)
      grandchildform.forEach(function(grandchildform){
        appendOption(grandchildform, num)
      })
    })
  })

  $(document).on('change', "#grandchildform", function() {
    $("#brand-form").show();
  })
});
