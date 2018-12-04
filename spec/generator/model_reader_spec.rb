require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

describe "ModelReader" do
  
  let(:reader) { ModelReader.new }

  describe "all_files" do
    it "returns the list of files in the app/models folder" do
      list = [
        "app/models/artist.rb",
        "app/models/chorus.rb",
        "app/models/genre.rb",
        "app/models/player.rb",
        "app/models/song_genre.rb",
        "app/models/song_player.rb",
        "app/models/song.rb",
        "app/models/verse.rb",
      ]
      expect(reader.all_files).to match_array(list)
    end
  end
end