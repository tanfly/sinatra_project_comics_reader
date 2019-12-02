require 'bundler/setup'
Bundler.require

require_all 'app'

configure :development do 
  set :database, "sqlite3:///database.db"
end

configure :production do
  db = URI.parse(ENV['HEROKU_POSTGRESQL_MAROON'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
    )
end