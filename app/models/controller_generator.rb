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
    




  end

  def index_action
    %(get '/#{@class.table_name}' do
      @#{@class.table_name} = #{@class.name}.all
      erb :'/#{@class.table_name}/index'
    end)
  end
  
end