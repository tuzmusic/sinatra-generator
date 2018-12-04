class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def belongs_to
    file.scan(/belongs_to :(\S+)/).first.map {|t| t.titleize}
  end

  def all_has_many
    file.scan(/has_many :(.+)/).map {|p| p.first}
  end
  
  def has_many
    all_has_many.select {|p| !p.include?('through')}
    .map { |p| p.titleize.gsub(' ', '').chomp('s') }
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