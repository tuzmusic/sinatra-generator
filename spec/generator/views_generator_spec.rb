require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}


describe "ViewsGenerator" do
  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist']
    cl.has_many = ['SongGenre']
    cl.many_through_join = { many: 'Genre', through: 'SongGenre' }
    end 
  }

  let(:vg) { ViewsGenerator.new.tap { |tg| 
      vg.class = cl 
    } 
  }

  it "has a @class property that stores a GeneratorClass instance" do
    expect(con_gen).to respond_to(:class)
    expect(con_gen.class.class).to eq(GeneratorClass)
  end


end