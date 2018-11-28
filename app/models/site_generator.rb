require 'erb'
require 'FileUtils'

class SiteGenerator

  attr_reader :path 

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
  end

  def generate(class_name)
    generate_model_code(class_name)
  end

  def generate_model_code(class_name)
    code_template_str = File.read("app/templates/model.erb")
    template = ERB.new(code_template_str)
    code = template.result(binding)
    new_path = FileUtils.mkdir_p "#{path}/models/"
    File.write("#{new_path.last}/#{class_name.downcase}.rb", code)
  end
  
  def call
    generate("Song")
  end
  
end