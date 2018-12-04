Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

  let(:a1) { GeneratorClass.new.tap {|cl| cl.name = "First Artist"} }


  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist', 'Album']
    cl.has_many = ['Verse',]
    cl.many_through_join = [ { many: 'Genre', through: 'SongGenre' },
                            { many: 'Player', through: 'SongPlayers' }]
    end 
  }
