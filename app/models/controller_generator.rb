class ControllerGenerator
  
  attr_accessor :class

  def all_self
    "@#{@class.table_name} = #{@class.name}.all"
  end

  def all_properties
    props = @class.belongs_to + @class.has_many_through.map{|p| p[:many]}
    props.collect do |prop_name|
      "@#{prop_name.underscore.pluralize} = #{prop_name}.all" 
    end
  end  

  def index_action
    %(get '/#{@class.table_name}' do
      @#{@class.table_name} = #{@class.name}.all
      erb :'/#{@class.table_name}/index'
    end)
  end

end