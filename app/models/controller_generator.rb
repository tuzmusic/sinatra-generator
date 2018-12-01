class ControllerGenerator
  
  attr_accessor :class

  def all_self
    "@#{@class.table_name} = #{@class.name}.all"
  end

  def index_action
    %(get '/#{@class.table_name}' do
      @#{@class.table_name} = #{@class.name}.all
      erb :'/#{@class.table_name}/index'
    end)
  end

end