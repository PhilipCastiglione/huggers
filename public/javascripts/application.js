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
  }
