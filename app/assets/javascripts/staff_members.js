$(document).ready(function(){
  staffMemberMassSubmitListener()
});

function staffMemberMassSubmitListener(){
  $('#staff-member-mass-submit-form').submit(function(e){
    e.preventDefault()
    $('tr').each(function(i, element){
      if (i > 0){
        var email = $(element).find('.staff-member-email').val()
        var role = $(element).find('.staff-member-role').val()
        $.ajax({
          url: "/staff_members",
          type: 'post',
          data:  {staff_member: {email: email, role: role}},
          success: (function(message){
            debugger
          })
        })
      }
    })
  })
}

function adminCheckboxValue(checkbox){
  return checkbox.checked ? "admin" : "staff"
}
