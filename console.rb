require 'pry'

require_relative 'config'
require_relative 'user'
require_relative 'profile_photo'

binding.pry
ActiveRecord::Base.connection.close
