$(document).ready(function(){
  positiveReferralListener();
  negativeReferralListener();
  tardyReferralListener();
  uniformReferralListener();

  $(function() {
    $("#referral_student_id").magicSuggest({
        // highlight: true,
        maxSuggestions: 15,
        noSuggestionText: 'No result matching your entry.',
        required: true,
        maxSelection: 1
    });
  });
  // $("select").combobox()
  // studentNameListener();
  // studentNameBlurListener();
  // studentNameFocusListener();
  // nameChoiceListener();
})

function positiveReferralListener(){
  $('#commendation').on('click', function(){
    $('#tardy-referral-form').hide();
    $('#uniform-referral-form').hide();
    $('#negative-referral-form').hide();
    $('#positive-referral-form').show();
  })
}

function negativeReferralListener(){
  $('#referral').on('click', function(){
    $('#tardy-referral-form').hide();
    $('#uniform-referral-form').hide();
    $('#positive-referral-form').hide();
    $('#negative-referral-form').show();
  })
}
function tardyReferralListener(){
  $('#tardy').on('click', function(){
    $('#uniform-referral-form').hide();
    $('#positive-referral-form').hide();
    $('#negative-referral-form').hide();
    $('#tardy-referral-form').show();
  })
}
function uniformReferralListener(){
  $('#uniform').on('click', function(){
    $('#positive-referral-form').hide();
    $('#negative-referral-form').hide();
    $('#tardy-referral-form').hide();
    $('#uniform-referral-form').show();
  })
}

function studentNameListener(){
  $(".student_name_input_field").keyup(function(){
    narrowList()
  })
}
function studentNameBlurListener(){
  $(".student_name_input_field").blur(function(){
    $('#student_name_suggestions').hide()
  })
}

function studentNameFocusListener(){
  $(".student_name_input_field").focus(function(){
    $('#student_name_suggestions').show()
  })
}

function narrowList(){
  var re = new RegExp($(".student_name_input_field").val(), "i")

  $.each($('.individual-student-name'), function(i, name){
    if (!$(name).text().match(re)){
      $(name).hide()
    }else {
      $(name).show()
    }
  })

}

function nameChoiceListener(){
  $('.individual-student-name').on('hover', function(){
    debugger
    $(".student_name_input_field").val($(this).text())
  })
}
