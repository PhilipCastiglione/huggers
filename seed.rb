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
  location: 'Melbourne'
)
matt = User.create(
  email: 'matt@fakemail.com',
  password: 'matt',
  first_name: 'Matt',
  last_name: 'Swan',
  dob: '08/09/1980',
  gender: 'male',
  relationship: 0,
  location: 'Melbourne'
)

katy.partner_user_id = dt.id
dt.partner_user_id = katy.id
mike.partner_user_id = sarah.id
sarah.partner_user_id = mike.id

dtpic = Profile_photo.create(
  user_id: dt.id,
  link: '/assets/images/profile_photos/daniel_profile1.jpg'
)
ronpic = Profile_photo.create(
  user_id: ron.id,
  link: '/assets/images/profile_photos/ronald_profile1.jpg'
)
Profile_photo.create(
  user_id: katy.id,
  link: '/assets/images/profile_photos/katy_profile1.jpg'
)
katypic = Profile_photo.create(
  user_id: katy.id,
  link: '/assets/images/profile_photos/katy_profile2.jpg'
)
Profile_photo.create(
  user_id: katy.id,
  link: '/assets/images/profile_photos/katy_profile3.jpg'
)
mikepic = Profile_photo.create(
  user_id: mike.id,
  link: '/assets/images/profile_photos/mike_profile1.jpg'
)
sarahpic = Profile_photo.create(
  user_id: sarah.id,
  link: '/assets/images/profile_photos/sarah_profile1.jpg'
)
janepic = Profile_photo.create(
  user_id: jane.id,
  link: '/assets/images/profile_photos/jane_profile1.jpg'
)
mattpic = Profile_photo.create(
  user_id: matt.id,
  link: '/assets/images/profile_photos/matt_profile1.jpg'
)

katy.profile_photo_id = katypic.id
dt.profile_photo_id = dtpic.id
ron.profile_photo_id = ronpic.id
mike.profile_photo_id = mikepic.id
sarah.profile_photo_id = sarahpic.id
jane.profile_photo_id = janepic.id
matt.profile_photo_id = mattpic.id

katy.save
dt.save
ron.save
mike.save
sarah.save
jane.save
matt.save

ActiveRecord::Base.connection.close
