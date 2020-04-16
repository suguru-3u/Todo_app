$(function(){
function buildHTML(lists){
  var html = '
  <tbody>
    <tr>
      <td>
        ${lists.title}
      </td>
      <td>
        ${lists.body}
      </td>
    </tr>
  </tbody>'
  return html;
}
  $('#new_list').on('submit',function(e){
    e.prevebtDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url:url,
      type:'Post',
      data:formData,
      dataType:'json',
      processData:false,
      contentType:false
    })
    .done(function(data){
      .var html = buildHTML(data);
      $(".todo_lists").append(html)
      $('.blank').val('')
    })
    .fail(function(){
        alert('error');
    })
  })
})
