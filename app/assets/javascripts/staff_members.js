$(document).ready(function(){
  staffMemberMassSubmitListener()
});

function staffMemberMassSubmitListener(){
  $('#staff-member-mass-submit-form').submit(function(e){
    e.preventDefault()
    $('tr').each(function(i, element){
      if (i > 0){
        var email = $(element).find('.staff-member-email').val()
        var admin = $(element).find('.staff-member-role').checked ? "true" : "false"
        if (email.length > 0){
          $.ajax({
            url: "/staff_members",
            type: 'post',
            data:  {staff_member: {email: email, admin: admin}},
            success: (function(message){
              var html = !!message["error"]["email"] ? "This email has already been taken.  No action taken." : "Success"
              
            })
          })
        }
      }
    })
  })
}
