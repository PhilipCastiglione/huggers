require 'active_record'

# heroku_db_url = 'postgres://' # can use heroku pg info then put in below

local_db = {
  :adapter => 'postgresql',
  :database => 'huggers'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || local_db )

ActiveRecord::Base.logger = Logger.new(STDERR) #show SQL in terminal
