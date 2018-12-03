class ControllerGenerator
  attr_accessor :class
  
  # CODE HELPER METHODS
  def all_self
    "@#{@class.table_name} = #{@class.name}.all"
  end

  def all_properties
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

  def redirect_show
    "redirect \"#{@class.table_name}/\#{#{@class.singular_name}.id}\""
  end

  def erb_call(path)
    "erb :'/#{@class.table_name}/#{path}'"
  end

  
  def clear_unchecked_params
    props = @class.has_many + @class.many_through_join.map{|p| p[:many]}
    props.map do |prop|
    %(if !params[:#{@class.singular_name}].keys.include?('#{prop.underscore}_ids')
      params[:song_info]['#{prop.underscore}_ids'] = []
    end)
    end
  end
end

class ControllerGenerator
  # ROUTE GENERATORS

  def index_action
    %(get '/#{@class.table_name}' do
      @#{@class.table_name} = #{@class.name}.all
      erb :'/#{@class.table_name}/index'
    end)
  end

  def new_action
    %(get '/#{@class.table_name}/new' do
      #{all_properties.join("\n      ")}
      #{erb_call("new")}
    end)
  end

  def create_action
    %(post '/#{@class.table_name}' do 
      #{create_self}
      #{create_new_belongs_to.join("\n      ")}
      #{create_new_has_many.join("\n      ")}
      #{@class.singular_name}.save
      #{redirect_show}
    end)    
  end

    def show_action
    %(get '/#{@class.table_name}/:id' do 
      @#{find_self}
      #{erb_call('show')}
    end)
  end

  def edit_action
    %(get '/#{@class.table_name}/:id/edit' do
      @#{find_self}
      #{all_properties.join("\n      ")}
      #{erb_call("edit")}
    end)
  end  

end