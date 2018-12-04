class ModelReader
  attr_accessor :filepath, :class, :file

  def class_name
    file.scan(/class (\S+)/).first.first
  end  

  def class_name_from_table_name(str)
    str.titleize.gsub(' ', '').singularize
  end

  def belongs_to
    array = file.scan(/belongs_to (.+)/)[0][0]
    .scan(/\w+/)
    .map {|p| class_name_from_table_name(p)}
  end

  def all_has_many
    file.scan(/has_many :(.+)/).map {|p| p.first.strip}
  end
  
  def has_many
    throughs = many_through_join.map {|p| p[:through].underscore.pluralize}
    ret = all_has_many.select do |p|
      should = true
      should = false if p.include?('through')
      should =  false if throughs.include?(p)
      should
    end.map {|p| class_name_from_table_name(p)}
  end

  def _has_many
    # Does not work if class name (singular) ends in S
    many = all_has_many.select do |p|
      throughs = all_through.map {|p| p[:through]}
      should_include = true
      if p.include?('through')
        through = p.scan(/through: :(\w+)/)[0][0]
        p = class_name_from_table_name(through)
      end
      should_include = false if throughs.include?(p)
      should_include
    end
    binding.pry
    many.map {|p| 
    class_name_from_table_name(p)}
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

  def properties # => list of property names only (no types)
    str = file.scan(/attr_accessor (.+)/)[0][0].scan(/\w+/)
  end


  def initialize(filepath)
    @filepath = filepath  
    @file = File.read(filepath)
  end
  
end