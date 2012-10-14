$(document).ready(function() {
  
  $('#stripe_request').modal({
    backdrop: 'static',
  })
  
  /* Small plugins on the settings form */
  $('input[rel="popover"]').popover({
    placement: 'right',
    trigger: 'focus'
  })
  $('input[rel="tooltip"]').tooltip({
    placement: 'right',
    trigger: 'focus'
  })
  $('a[rel="popover"]').popover({
    placement: 'right',
    trigger: 'hover'
  })
  $('.timepicker-default').timepicker({
    defaultTime: '12:00 AM'
  });
  // $('form#settings').validate({
  //     rules: {
  //       name: {
  //         minlength: 2,
  //         required: true
  //       }
  //     },
  //     highlight: function(label) {
  //      $(label).closest('.control-group').addClass('error');
  //     },
  //     success: function(label) {
  //      label
  //        .text('OK!').addClass('valid')
  //        .closest('.control-group').addClass('success');
  //     }
  //   });
  
  
  $('div.preview_toggle button').click(function(e) {
    e.preventDefault();
    
    var view = $(this).data('target');
    
    if( view != 'web' )
      $('div.orientation_toggle').show();
    else
      $('div.orientation_toggle').hide();
    
    $('div#finalize .view').hide().removeClass('active');
    $('div#finalize .'+view+'_view').show().addClass('active');
    
  });
  
  $('div.orientation_toggle button').click(function() {
    
    var orientation = $(this).data('orientation');
    
    if( orientation == 'landscape' )
      $('#finalize .active').addClass('landscape');
    else
      $('#finalize .active').removeClass('landscape');
    
  });
  
  /** WEB PREVIEW **/
  $('div.edit_content').click(function(e) {
    e.preventDefault();
    var content = $(this).text();
    $('#edit_blurb').find('textarea#blurb').text($.trim(content))
    $('#edit_blurb').modal();
  });
  $('#edit_blurb button.save').click(function(e) {
    $('#edit_blurb').modal('hide');
  });

  $('a.add_faq').click(function(e) {
    e.preventDefault();
    $("#add_faq input[type='text']").val("");
    $('#add_faq textarea').text("");
    $('#add_faq').modal();
  });

  $('a.add_section').click(function(e) {
    e.preventDefault();
    $("#add_section input[type='text']").val("");
    $('#add_section textarea').text("");
    $('#add_section').modal();
  });
  
  
  $('span.edit_number').popover({
    trigger: 'click',
    title: 'Edit Goal',
    content: '<div class="input-append"><input type="text" id="goal" class="span2" /><button class="btn btn-primary" type="button">Save</button></div>'
  });
  
  
  if(new_campaign == false){
    $("#step2link").click();
  }
  
  
});