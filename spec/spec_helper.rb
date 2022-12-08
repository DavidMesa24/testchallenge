require 'rspec'
require 'faker'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'shoulda/matchers'

require_relative '../app.rb'

set :environment, :test
set :database, :test

ActiveRecord::Base.logger.level = 1

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /.rubies/
  config.backtrace_exclusion_patterns << /.gem/

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed
end