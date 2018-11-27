require 'erb'
require 'FileUtils'

class SiteGenerator

  attr_reader :path 

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
  end

  def generate_class(class_name)
    code_template_str = File.read("app/templates/model.erb")
    template = ERB.new(code_template_str)
    code = template.result(binding)
    binding.pry
  end
  
  def call
    generate_class("Song")
  end
  
end