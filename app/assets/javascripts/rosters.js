$(document).ready(function(){
  // makeListsSortable()
  addToRoster()
  subtractFromRoster();
  checkBoxListenersOn()
  nameFilterListener()
  titleSubmitListener()
  gradeFilterButtonListener()
  nameFilterButtonListener()
});

$(document).ajaxComplete(function() {
  filterElements()
  // makeListsSortable()
  addToRoster()
  subtractFromRoster();
});

function rosterIds(){
  return ($('#selected-students-list').find('.student-id-hidden-field')).toArray().map(function(element){
    return $(element).val()
  })
}

function makeListsSortable(){
  $( "#all-students-list, #selected-students-list" ).sortable({
    appendTo: 'body',
    connectWith: ".connectedSortable",
    scroll: false,
    start: function (event, ui) {
      ui.item.toggleClass("highlight");
    },
    stop: function (event, ui) {
          ui.item.toggleClass("highlight");
    },
    update: function(){
      updateLists()
    }
  }).disableSelection();
}

function updateLists(){
  $.ajax({
  url: window.location.href.slice(0, -5),
  type: 'patch',
  data:  {roster_ids: rosterIds()},
  success: (function(message){
    $('#draggable-student-lists').html(message)
    })
  })
}

function addToRoster(){
  $('.add-icon').on('click', function(e){
    $($(this).parent()).hide()
    $("#selected-students-list").append($(this).parent());
    updateLists()
  })
}
function subtractFromRoster(){
  $('.minus-icon').on('click', function(e){
    $(this).parent().remove();
    updateLists()
  })
}

function checkedGrades(){
  return $('.grade-checkbox-full').toArray().map(function(element){
    return $(element).next().text().trim()
  })
}

function checkBoxListenersOn(){
  $('.grade-checkbox-empty').on('click', function(){
    $(this).removeClass('fa-circle-o');
    $(this).removeClass('grade-checkbox-empty');
    $(this).addClass('fa-check-circle');
    $(this).addClass('grade-checkbox-full');
    checkBoxListenersOff()
    checkBoxListenersOn();
    filterElements()
  });

  $('.grade-checkbox-full').on('click', function(){
    $(this).removeClass('fa-check-circle');
    $(this).removeClass('grade-checkbox-full');
    $(this).addClass('fa-circle-o');
    $(this).addClass('grade-checkbox-empty');
    checkBoxListenersOff();
    checkBoxListenersOn();
    filterElements()
  });
}

function checkBoxListenersOff(){
  $('.grade-checkbox-empty').off()
  $('.grade-checkbox-full').off()
}

function nameFilterListener(){
  $('#student-name-filter-field').on('keyup', function(){
    filterElements()
  })
}

function filterByName(element){
  var re = new RegExp($("#student-name-filter-field").val(), "i")
    if (!$(element).text().match(re)){
      return false
    }else {
      return true
    }
}

function filterByGrade(element){
  // $('.sortable-student-info-wrapper').each(function(index, element){
    if (checkedGrades().length == 0){
      return true
    }else if(checkedGrades().indexOf($(element).find('.student-grade-hidden-field').val()) >= 0){
      return true
    }else {
      return false
    }
  // })
}

function filterElement(element){
  if (!!filterByName(element) && !!filterByGrade(element)){
    $(element).show()
  }else {
    $(element).hide()
  }
}

function filterElements(){
  $('.sortable-student-info-wrapper').each(function(index, element){
    filterElement(element)
  })
}

function titleSubmitListener(){
  $('.title-submit-form').on('submit', function(e){
    e.preventDefault()
    e.stopPropagation()

    $.ajax({
      url: window.location.href.slice(0, -5) + '/title',
      type: 'post',
      data:  {title: $('#roster_title').val()},
      success: (function(message){
        $('#title-header').html(message.title)
      })
    })
  })
}

function nameFilterButtonListener(){
  $("#show-name-filter-btn").on('click', function(){
    $('#filter-by-name').slideToggle(500)
  })
}

function gradeFilterButtonListener(){
  $("#show-grade-filter-btn").on('click', function(){
    $('#filter-by-grade').slideToggle(500)
  })
}
