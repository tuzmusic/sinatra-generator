require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

describe "ViewsGenerator" do
  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist', 'Album']
    cl.has_many = ['Verse', 'Chorus']
    cl.many_through_join = [ { many: 'Genre', through: 'SongGenre' },
                            { many: 'Player', through: 'SongPlayers' }]
    end 
  }

  let(:vg) { ViewsGenerator.new.tap { |tg| 
      vg.class = cl 
    } 
  }

  path = "fixtures/song_infos_controller_full_mock.rb"

  it "has a @class property that stores a GeneratorClass instance" do
    expect(tg).to respond_to(:class)
    expect(tg.class.class).to eq(GeneratorClass)
  end


end