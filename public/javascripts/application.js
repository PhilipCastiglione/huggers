var SQLDobToAge = function(SQLDob) {

      var today = [
        (new Date()).getFullYear(),
        (new Date()).getMonth(),
        (new Date()).getDay()
      ];
      var dob = SQLDob.split("-");

      if (today[1] > dob[1]) {
        var age = today[0] - dob[0];
      } else if (today[1] < dob[1]) {
        var age = today[0] - dob[0] - 1;
      } else {
        if (today[2] >= dob[2]) {
          var age = today[0] - dob[0];
        } else {
          var age = today[0] - dob[0] - 1;
        }
      }

      return age;

};

var renderProfilePic = function(profile_photo_id, HTMLObject) {
    
  $.ajax({

    url: '/api/profile_photos',
    method: 'get',
    dataType: 'json'

  }).done(function(data) {

    for (var i=0; i<data.length; i++) {
      if (data[i]['id'] === profile_photo_id) {
        $(HTMLObject).html("<img src=" + data[i]['link'] + " alt='profile picture'>");
        break;
      }
    }

  });
};

var includeUser = function(criteria, user) {

  var age = SQLDobToAge(user['dob']);

  if ((criteria["gender"].toLowerCase() === user['gender'].toLowerCase() ||
    criteria["gender"] === "" ) && (
    criteria["min_age"] <= age ||
    criteria["min_age"] === "" ) && (
    criteria["max_age"] >= age ||
    criteria["max_age"] === "" ) && (
    criteria["location"].toLowerCase() === user['location'].toLowerCase() ||
    criteria["location"] === "" )) {
    return true;
  } else {
    return false;
  }

}

var confirmDelete = function() {
  $('.warning1').show();
  $('.warning2').show();
  $('.warning3').show();
  $('form#form_delete').submit(function() {
    delConfirmed = true;
  });
};

// menu initialize
var menuInit = function() {
  $('header img#menu-toggle').on('click', function(){
      $('nav#menu').animate({width:'toggle'},200);
  })
}

$(document).ready(menuInit);
