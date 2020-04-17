// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function(){
  function buildHTML(list){
    var html = `<tr><td>${list.title}</td><td>${list.body}</td>
    <td><a href = /lists/${list.id}/edit> 編集</a></td>
    <td><a data-confirm = "本当にいいんですか？",rel = "nofollow", href = /lists/${list.id}, data-method = "DELETE">削除</a></td>
    </tr>`
    return html;
  }
  $('#new_list').on('submit',function(e){
    e.preventDefault();
    console.log(this)
    var formData = new
    FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url:url,
      type:'Post',
      data:formData,
      dataType:'json',
      processData:false,
      contentType:false
    })
    .done(function(list){
      var html = buildHTML(list);
      $(".todo_lists").append(html)
      $('.blank').val('')
    })
    .fail(function(list){
        alert('error');
    })
    .always(function(list){
      $('.form__submit').prop('disabled', false);
    })
  })
})
