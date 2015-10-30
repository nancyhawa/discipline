$(document).ready(function(){
  closeActivityFeedListener()
});

function closeActivityFeedListener(){
  // debugger
  $('.activity-feed-close').click(function(){
    // debugger
    $('#feed').remove()
  })
}
