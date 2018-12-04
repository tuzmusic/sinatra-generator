Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

  # let(:a1) { GeneratorClass.new.tap {|cl| cl.name = "First Artist"} }

class MockObjects

    def self.cl
      cl = GeneratorClass.new.tap do |cl|
      cl.name = "SongInfo"
      cl.properties = [ {name: 'name', type: 'string'},
                        {name: 'artist_name', type: 'string'},
                        {name: 'duration_in_seconds', type: 'integer'} ]
      cl.belongs_to = ['Artist', 'Album']
      cl.has_many = ['Verse',]
      cl.has_many_through = [{ many:'Lyric', through:'Verse' }]
      cl.many_through_join = [ { many: 'Genre', through: 'SongGenre' },
                              { many: 'Player', through: 'SongPlayer' }]
      end 
    end
  

  
end