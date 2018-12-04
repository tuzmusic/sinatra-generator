class TableGenerator

  attr_accessor :class

  def table_name
    @class.table_name
  end  

  def create_table_filename
    date_str = DateTime.now.strftime '%Y%m%d%H%M%S'
    filename = "#{date_str}_create_#{table_name}.rb"
  end

  def properties_columns
    @class.properties.map do |prop|
      "t.#{prop[:type.downcase]} :#{prop[:name.downcase]}"
    end
  end

  # has_many and has_many_through relationships are not represented in the table (they're represented in /other/ tables)

  def belongs_to_columns
    @class.belongs_to.map do |cl|
      "t.integer :#{cl.downcase}_id"
    end
  end

  def create_table_code
    path = "generator/app/templates/create_table_migration.erb"
    template_str = File.read(path)
    template = ERB.new(template_str)
    template.result(binding)
  end

  def generate_create_table_migration
    File.write("/db/migrate/#{create_table_filename}", create_table_code)
  end

end