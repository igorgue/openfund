$(function () {
  
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
  
  
  $('div.preview_toggle button').click(function() {
    
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
  $('div.edit_content').click(function() {
    var content = $(this).text();
    $('#edit_blurb').find('textarea#blurb').text(content)
    $('#edit_blurb').modal();
  });
  
  $('span.edit_number').popover({
    trigger: 'click',
    title: 'Edit Goal',
    content: '<div class="input-append"><input type="text" id="goal" class="span2" /><button class="btn btn-primary" type="button">Save</button></div>'
  });
  
  
  
  
  
});