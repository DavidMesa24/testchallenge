
require 'sinatra'
require 'uri'

configure :production, :development do
  uri = URI.parse(ENV['ELEPHANTSQL_URL'] || 'postgres://ucrbyicl:wKwZV6I9XVxY6YSaHyLofB5CBy5Kxhk_@babar.db.elephantsql.com/ucrbyicl')
  ActiveRecord::Base.establish_connection(adapter: 'postgresql', host: uri.host, username: uri.user, password: uri.password, database: uri.path.sub('/', ''))
end

configure :test do
  uri = URI.parse(ENV['ELEPHANTSQL_URL'] || 'postgres://sxxrdthy:wKwZV6I9XVxY6YSaHyLofB5CBy5Kxhk_@babar.db.elephantsql.com/sxxrdthy')
  ActiveRecord::Base.establish_connection(adapter: 'postgresql', host: uri.host, username: uri.user, password: uri.password, database: uri.path.sub('/', ''))
end