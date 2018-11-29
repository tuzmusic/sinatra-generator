class TableGenerator

  attr_accessor :class

  def table_name
    @class.name.underscore
  end  

end