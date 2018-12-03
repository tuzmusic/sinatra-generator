class ControllerGenerator
  
  attr_accessor :class

  def all_self
    "@#{@class.table_name} = #{@class.name}.all"
  end

  def all_properties
    # props = @class.belongs_to + @class.many_through_join.map{|p| p[:many]} + @class.has_many
    @class.relationship_names.collect do |prop_name|
      "@#{prop_name.underscore.pluralize} = #{prop_name}.all" 
    end
  end  

  def create_self
    "#{@class.singular_name} = #{@class.name}.create(params['#{@class.singular_name}'])"    
  end

  def update_self
    "#{@class.singular_name} = #{@class.name}.update(params['#{@class.singular_name}'])"   
  end
  
  def find_self
    "#{@class.singular_name} = #{@class.name}.find(params[:id])"   
  end

  def create_new_belongs_to
    @class.belongs_to.map do |prop|
      "#{@class.singular_name}.#{prop.underscore} = #{prop}.create(name: params['#{prop.underscore}_name']) unless params['#{prop.underscore}_name'].empty?"
    end
  end
  
  def create_new_has_many
    props = @class.has_many + @class.many_through_join.map{|p| p[:many]}
    props.map do |prop|
      "#{@class.singular_name}.#{prop.underscore.pluralize} << #{prop}.create(name: params['#{prop.underscore}_name']) unless params['#{prop.underscore}_name'].empty?"
      end
  end

  def index_action
    %(get '/#{@class.table_name}' do
      @#{@class.table_name} = #{@class.name}.all
      erb :'/#{@class.table_name}/index'
    end)
  end
  
end