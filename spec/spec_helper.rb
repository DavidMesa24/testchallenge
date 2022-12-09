require 'rspec'
require 'faker'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'shoulda/matchers'
require 'rack/test'

require_relative '../app.rb'

set :environment, :development

ActiveRecord::Base.logger.level = 1

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /.rubies/
  config.backtrace_exclusion_patterns << /.gem/
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Rack::Test::Methods

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.order = :random
  Kernel.srand config.seed
end