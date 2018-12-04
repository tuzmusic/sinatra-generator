class ModelReader
  attr_accessor :filepath, :class, :file

  def initialize(filepath)
    @filepath = filepath  
    @file = File.read(filepath)
  end
  
end