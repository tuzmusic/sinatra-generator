require 'date'
require 'erb'
require 'FileUtils'

class SiteGenerator

  attr_reader :classes 
 
  def generate_generator_classes
    paths = Dir["/app/models/*.rb"]
  end

  def call
    generate_generator_classes
    generate_migrations
    generate_controllers
  end
end