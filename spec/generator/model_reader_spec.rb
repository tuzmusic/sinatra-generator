require_relative '../spec_helper'
require_relative './class_object'
Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

describe "ModelReader" do
  
  let(:reader) { ModelReader.new("app/models/song_info.rb") }
  let(:cl) { MockObjects.cl }
  it "reads a single class file and creates a GeneratorClass object" do end
  
  describe "initialize" do
    it "takes a filepath and stores the contents of the file in the file property" do
      expect(reader.file).to eq(File.read("app/models/song_info.rb"))
    end
  end

  describe "class_name" do
    it "gets the name of the class" do
      expect(reader.class_name).to eq("SongInfo")
      expect(reader.class_name).to eq(cl.name)
    end
  end  

  describe "belongs_to" do
    it "gets the belongs_to relationships" do
      expect(reader.belongs_to).to match(["Artist"])
    end    
  end
  
  describe "all_has_many" do
    it "gets all lines of code describing has_many relationships, through or not" do
      list = [
        "genres, through: :song_info_genres",
        "song_info_genres",
        "players, through: :song_info_players",
        "song_info_players",
        "verses",
        "lyrics, through: :verses"
      ]
      expect(reader.all_has_many).to match_array(list)
    end
  end

  describe "has_many" do
    it "gets the has_many relationships that have no through" do
      expect(reader.has_many).to match_array(["SongInfoGenre", "SongInfoPlayer", "Verse",])
    end    
  end
  
  describe "all_through" do
    it "creates hashes for all through relationships" do
      through = [ { many: 'Genre', through: 'SongInfoGenre' },
                  { many: 'Lyric', through: 'Verse' },
                  { many: 'Player', through: 'SongInfoPlayer' }]     
      expect(reader.all_through).to match_array(through)
    end
  end

  describe "has_many_through" do
    it "gets has_many_through relationships that are NOT join relationships" do
      expect(reader.has_many_through).to match_array([{many:'Lyric', through:'Verse'}])  
    end
  end
  
  describe "many_through_join" do
    it "gets many_to_many relationships with their through (join table) names" do
      rels = [ { many: 'Genre', through: 'SongInfoGenre' },
          { many: 'Player', through: 'SongInfoPlayer' }]
      expect(reader.many_through_join).to match_array(rels)  
    end
  end

  describe "properties" do
    it "gets non-relationship properties" do
      properties = [ {name: 'name', type: 'string'},
                    {name: 'artist_name', type: 'string'},
                    {name: 'duration_in_seconds', type: 'integer'} ]
      list = ['name', 'artist_name', 'duration_in_seconds']
      expect(reader.properties).to match_array(list)
    end

    xit "determines the data type for these properties?!?!?!" do
      
    end
  end

  describe "create_generator_class" do
    
  end

end