require 'date'
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
    generate_migration(class_name)
  end

  def generate_model_code(class_name)
    code_template_str = File.read("app/templates/model.erb")
    template = ERB.new(code_template_str)
    code = template.result(binding)
    new_path = FileUtils.mkdir_p "#{path}/app/models/"
    filename = "#{new_path.last}/#{class_name.downcase}.rb"
    File.write(filename, code)
  end
  
  def generate_migration(class_name)
    date_str = DateTime.now.strftime '%Y%m%d%H%M%S'
    filename = "#{date_str}_create_#{class_name.downcase}s.rb"
    migr_path = FileUtils.mkdir_p "#{path}/db/migrate"
    full_path = "#{migr_path.last}/#{filename}"
    
    binding.pry
  end
  
  def call
    generate("Song")
  end
  
end