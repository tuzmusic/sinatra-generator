class TableGenerator

  attr_accessor :class

  def table_name
    @class.name.underscore.pluralize
  end  

  def migration_filename
    date_str = DateTime.now.strftime '%Y%m%d%H%M%S'
    filename = "#{date_str}_create_#{table_name}.rb"
  end

  def properties_columns
    @class.properties.map do |prop|
      "t.#{prop[:type.downcase]} :#{prop[:name.downcase]}"
    end
  end

  def belongs_to_columns
    @class.belongs_to.map do |cl|
      "t.integer :#{cl.downcase}_id"
    end
  end

  def migration_code
    path = "app/templates/migration.erb"
    template_str = File.read(path)
    template = ERB.new(template_str)
    template.result(binding)
  end

  def generate_migration
    File.write("_generated/db/migrate/#{migration_filename}", migration_code)
  end

end