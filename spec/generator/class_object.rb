Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

  # let(:a1) { GeneratorClass.new.tap {|cl| cl.name = "First Artist"} }

class MockObjects

    def self.cl
      cl = GeneratorClass.new
      cl.name = "SongInfo"
      # duration_in_seconds is set to string for class generator spec
      cl.properties = [ {name: 'name', type: 'string'},
                        {name: 'artist_name', type: 'string'},
                        {name: 'duration_in_seconds', type: 'string'} ]
      cl.belongs_to = ['Artist', 'Album']
      cl.has_many = ['Verse',]
      cl.has_many_through = [{ many:'Lyric', through:'Verse' }]
      cl.many_through_join = [ { many: 'Genre', through: 'SongInfoGenre' },
                              { many: 'Player', through: 'SongInfoPlayer' }]
      cl
    end
  

  
end