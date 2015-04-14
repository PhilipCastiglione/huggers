require 'pry'

require_relative 'config'
require_relative 'user'
require_relative 'profile_photo'

User.delete_all
Profile_photo.delete_all
katy = User.create(
  email: 'katyperry@fakemail.com',
  password: 'katy',
  first_name: 'Katy',
  last_name: 'Perry',
  dob: '15/10/1984',
  gender: 'female',
  relationship: 1,
  nationality: 'American',
  location: 'Melbourne'
)
dt = User.create(
  email: 'dt@fakemail.com',
  password: 'dt',
  first_name: 'Daniel',
  last_name: 'Tsui',
  dob: '15/10/1962',
  gender: 'male',
  relationship: 1,
  nationality: 'Australian',
  location: 'Melbourne'
)
ron = User.create(
  email: 'rmcd@fakemail.com',
  password: 'ron',
  first_name: 'Ronald',
  last_name: 'McDonald',
  dob: '30/04/1963',
  gender: 'male',
  relationship: 0,
  nationality: 'American',
  location: 'Boston'
)
mike = User.create(
  email: 'mike@fakemail.com',
  password: 'mike',
  first_name: 'Mike',
  last_name: 'Jones',
  dob: '03/08/1988',
  gender: 'male',
  relationship: 1,
  nationality: 'Australian',
  location: 'Perth'
)
sarah = User.create(
  email: 'sarah@fakemail.com',
  password: 'sarah',
  first_name: 'Sarah',
  last_name: 'Brown',
  dob: '15/06/1990',
  gender: 'female',
  relationship: 1,
  nationality: 'Canadian',
  location: 'Perth'
)
jane = User.create(
  email: 'jane@fakemail.com',
  password: 'jane',
  first_name: 'Jane',
  last_name: 'Davies',
  dob: '27/11/1991',
  gender: 'female',
  relationship: 0,
  nationality: 'Australian',
  location: 'Melbourne'
)


katy.partner_user_id = dt.id
dt.partner_user_id = katy.id
mike.partner_user_id = sarah.id
sarah.partner_user_id = mike.id

dtpic = Profile_photo.create(
  user_id: dt.id,
  link: 'https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/1700/thumb_HEADSHOTS__2001_.jpg'
)
ronpic = Profile_photo.create(
  user_id: ron.id,
  link: 'https://s3.amazonaws.com/yf-interactive/ron-m-before-after-hoz/img/ronald-old.jpg'
)
Profile_photo.create(
  user_id: katy.id,
  link: 'https://cbsradionews.files.wordpress.com/2014/01/katy_perry1.jpg?w=620&h=349&crop=1'
)
katypic = Profile_photo.create(
  user_id: katy.id,
  link: 'http://www.allthetests.com/quiz32/picture/pic_1423339389_1.jpg'
)
Profile_photo.create(
  user_id: katy.id,
  link: 'http://d1qhhammy2egfp.cloudfront.net/wp-content/themes/katyperry-2/library/img/katyyellowshirt.png'
)
mikepic = Profile_photo.create(
  user_id: mike.id,
  link: 'http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image-590x825.jpg'
)
sarahpic = Profile_photo.create(
  user_id: sarah.id,
  link: 'http://upload.wikimedia.org/wikipedia/commons/6/65/Kruse_CNDLS_Profile.png'
)
janepic = Profile_photo.create(
  user_id: jane.id,
  link: 'http://www.realtimearts.net/data/images/art/47/4764_profile_mudie.jpg'
)

katy.profile_photo_id = katypic.id
dt.profile_photo_id = dtpic.id
ron.profile_photo_id = ronpic.id
mike.profile_photo_id = mikepic.id
sarah.profile_photo_id = sarahpic.id
jane.profile_photo_id = janepic.id

katy.save
dt.save
ron.save
mike.save
sarah.save
jane.save

ActiveRecord::Base.connection.close
