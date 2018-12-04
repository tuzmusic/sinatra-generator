class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def belongs_to
    file.scan(/belongs_to :(\S+)/).first.map {|t| t.titleize}
  end

  def class_names_from_array_of_table_names(arr)
    # binding.pry
    arr.map {|p| p.titleize.gsub(' ', '').singularize}
  end

  def all_has_many
    file.scan(/has_many :(.+)/).map {|p| p.first.strip}
  end
  
  def has_many
    # Does not work if class name (singular) ends in S
    array = all_has_many.select {|p| !p.include?('through')}
    class_names_from_array_of_table_names(array)
    # .map { |p| p.titleize.gsub(' ', '').singularize }
  end
  
  def all_through
    strs = all_has_many.select {|p| p.include?('through')}
    hashes = strs.map do |str|
      matches = str.scan(/(\w+), through: :(\w+)/).first
      binding.pry
      {many: matches[0].strip, through: matches[1].strip}
    end    
  end

  def has_many_through
  end
  
  def many_through_join
    
    # .map { |p| p.titleize.gsub(' ', '').singularize }

  end

  def properties
    
  end


  def initialize(filepath)
    @filepath = filepath  
    @file = File.read(filepath)
  end
  
end