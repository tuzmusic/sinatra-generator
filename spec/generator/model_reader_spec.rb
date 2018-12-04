require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

describe "ModelReader" do
  
  let(:reader) { ModelReader.new("app/models/song_info.rb") }

  it "reads a single class file and creates a GeneratorClass object" do end
  
  describe "initialize" do
    it "takes a filepath and stores the contents of the file in the file property" do
      expect(reader.file).to eq(File.read("app/models/song_info.rb"))
    end
  end

  describe "class_name" do
    it "gets the name of the class" do
      expect(reader.class_name).to eq("SongInfo")
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
        "chorus",
      ]
      expect(reader.all_has_many).to match_array(list)
    end
  end

  describe "has_many" do
    it "gets the has_many relationships that have no through" do
      expect(reader.has_many).to match_array(["SongInfoGenre", "SongInfoPlayer", "Verse", "Chorus"])
    end    
  end
  
  describe "has_many_through" do
    xit "gets has_many_through relationships that are NOT join relationships" do
      
    end
  end
  
  describe "many_through_join" do
    it "gets many_to_many relationships with their through (join table) names" do
      rels = [ { many: 'Genre', through: 'SongInfoGenre' },
          { many: 'Player', through: 'SongInfoPlayers' }]
      expect(reader.many_through_join).to match_array(rels)  
    end
  end

  describe "properties" do
    it "gets non-relationship properties" do
      properties = [ {name: 'name', type: 'string'},
                    {name: 'artist_name', type: 'string'},
                    {name: 'duration_in_seconds', type: 'integer'} ]
      expect(reader.properties).to match_array(properties)
    end
    xit "determines the data type for these properties?!?!?!" do
      
    end
  end

end