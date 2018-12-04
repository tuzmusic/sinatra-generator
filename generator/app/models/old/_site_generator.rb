require 'date'
require 'erb'
require 'FileUtils'

class SiteGenerator

  attr_reader :path 

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
  end

  
  def call
    ClassGenerator.new(path:@path, class_name:"Song").generate
  end
  
end