class ClassGenerator
  def initialize(path:, class_name:)
    @path = path
    @class_name = class_name
  end

  def code_from(template_file) 
    code_template_str = File.read(template_file)
    template = ERB.new(code_template_str)
    template.result(binding)
  end

  def generate_model_code
    code = code_from "app/templates/model.erb" 
    new_path = FileUtils.mkdir_p "#{@path}/app/models/"
    full_path = "#{new_path.last}/#{@class_name.downcase}.rb"
    File.write(full_path, code)
  end
  
  def generate_migration
    code = code_from "app/templates/migration.erb" 
    date_str = DateTime.now.strftime '%Y%m%d%H%M%S'
    filename = "#{date_str}_create_#{@class_name.underscore}s.rb"
    migr_path = FileUtils.mkdir_p "#{@path}/db/migrate"
    full_path = "#{migr_path.last}/#{filename}"
    File.write(full_path, code)
  end

  def generate
    generate_model_code
    generate_migration
  end
end