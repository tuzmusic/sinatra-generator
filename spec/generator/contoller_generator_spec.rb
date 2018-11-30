require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

describe "ControllerGenerator" do
  
  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist']
    cl.has_many = ['SongGenre']
    cl.has_many_through = { many: 'Genre', through: 'SongGenre' }
    end 
  }

  let(:con_gen) { ControllerGenerator.new.tap do |cg|
      cg.class = cl
    end
  }

  require_relative '../../fixtures/song_infos_controller methods'
  let(:mock) { SongInfosControllerMock.new }

  it "has a @class property that stores a GeneratorClass instance" do
    expect(con_gen).to respond_to(:class)
    expect(con_gen.class.class).to eq(GeneratorClass)
  end

  describe "index_action" do
    it "returns code for an index route" do
      expect(con_gen.index_action).to eq(mock.index_action)
    end
    
  end
end