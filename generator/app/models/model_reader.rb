class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def belongs_to
    file.scan(/belongs_to :(\S+)/).first.map {|t| t.titleize}
  end

  def all_has_many
    file.scan(/has_many :(.+)/).map {|p| p.first.strip}
  end
  
  def has_many
    # Does not work if class name (singular) ends in S
    all_has_many.select {|p| !p.include?('through')}
    .map { |p| p.titleize.gsub(' ', '').singularize }
  end
  
  def all_through
    
  end

  def has_many_through
    strs = all_has_many.select {|p| p.include?('through')}
    binding.pry
    hashes = strs.map do |str|
      matches = str.scan(/has_many :(\w+), through: :(\w+)/)
      {many: matches[0], through: matches[1]}
    end
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