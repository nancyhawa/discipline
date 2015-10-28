$(document).ready(function(){
  positiveReferralListener();
  negativeReferralListener();
  tardyReferralListener();
  uniformReferralListener();
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
