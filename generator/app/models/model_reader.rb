class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def belongs_to
    file.scan(/belongs_to :(\S+)/).first.map {|t| t.titleize}
  end
  
  def has_many
    
  end
  
  def has_many_through
    
  end
  
  def many_through_join
    
  end

  def properties
    
  end


  def initialize(filepath)
    @filepath = filepath  
    @file = File.read(filepath)
  end
  
end