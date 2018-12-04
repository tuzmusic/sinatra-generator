class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def class_name_from_table_name(str)
    str.titleize.gsub(' ', '').singularize
  end

  def belongs_to
    array = file.scan(/belongs_to :(\S+)/).first
    .map {|p| class_name_from_table_name(p)}
  end

  def all_has_many
    file.scan(/has_many :(.+)/).map {|p| p.first.strip}
  end
  
  def has_many
    # Does not work if class name (singular) ends in S
    all_has_many.select {|p| !p.include?('through')}
    .map {|p| class_name_from_table_name(p)}
  end
  
  def all_through
    strs = all_has_many.select {|p| p.include?('through')}
    hashes = strs.map do |str|
      matches = str.scan(/(\w+), through: :(\w+)/).first
      .map {|p| class_name_from_table_name(p)}
      { many: matches[0].strip, through: matches[1].strip }
    end    
  end

  def has_many_through
    all_through.select do |hash|
      !hash[:through].include?(hash[:many])
    end
  end
  
  def many_through_join
    all_through.select do |hash|
      hash[:through].include?(hash[:many])
    end
  end

  def properties
    
  end


  def initialize(filepath)
    @filepath = filepath  
    @file = File.read(filepath)
  end
  
end