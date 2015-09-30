require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'active_record'
require 'ostruct'
require 'json'

require 'sinatra' unless defined?(Sinatra)
require 'sinatra/reloader' if settings.development?

Dotenv.load

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/'
               )

  # load libs
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

  # db connection
  db_path = "data/#{ Sinatra::Base.environment }/data.sqlite3"
  ActiveRecord::Base.establish_connection(
    :adapter  => "sqlite3",
    :database => db_path 
  )

  # create db schema
  DataMigration.up

  # load information
  path = File.join(File.dirname(__FILE__), 'information')
  InformationLoader.load(path)
end