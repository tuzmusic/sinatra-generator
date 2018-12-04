require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"
Dir[File.join(File.dirname(__FILE__), "../generator/app/models", "*.rb")].each {|f| require f}

=begin
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/nyc#{ENV['SINATRA_ENV']}.sqlite"
)

require_relative "../generator/app//controllersgenerator/application_controller.rb"
=end


Dir[File.join(File.dirname(__FILE__), "../generator/app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../generator/app/controllers", "*.rb")].sort.each {|f| require f}