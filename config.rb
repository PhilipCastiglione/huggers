require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'huggers'
)

ActiveRecord::Base.logger = Logger.new(STDERR) #show SQL in terminal
