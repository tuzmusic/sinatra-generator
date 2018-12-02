class GeneratorClass

  attr_accessor :name, :properties, :belongs_to, :has_many, :many_through_join, :has_many_through

  def table_name
    @name.underscore.pluralize
  end  
  
end