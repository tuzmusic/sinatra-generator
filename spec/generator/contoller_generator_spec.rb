require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

describe "ControllerGenerator" do
  
  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist', 'Album']
    cl.has_many = ['Verse']
    cl.many_through_join = [ { many: 'Genre', through: 'SongGenre' },
                            { many: 'Player', through: 'SongPlayers' }]
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

  describe "small code generators" do
    describe "all_self" do
      it "returns code to store all instances of the 'self' class" do
        expect(con_gen.all_self).to eq('@song_infos = SongInfo.all')
      end
    end

    describe "all_properties" do
      it "returns code to store all instances of all has_many and belongs_to objects" do
        expect(con_gen.all_properties).to match_array(mock.all_properties)
      end
    end
    
    describe "create_self" do
      it "returns code to create an instance of the 'self' class" do
        expect(con_gen.create_self).to eq("song_info = SongInfo.create(params['song_info'])")
      end
    end
    
    describe "update_self" do
      it "returns code to update an instance of the 'self' class" do
        expect(con_gen.update_self).to eq("song_info = SongInfo.update(params['song_info'])")
      end
    end
    
    describe "find_self" do
      it "returns code to find an instance of the 'self' class using params[:id]" do
        expect(con_gen.find_self).to eq("song_info = SongInfo.find(params[:id])")
      end
    end
    
    describe "create_new_belongs_to" do
      it "returns code to assign new instances of belongs_to properties" do
        lines = ["song_info.artist = Artist.create(name: params['artist']['name']) unless params['artist']['name'].empty?",
        "song_info.album = Album.create(name: params['album']['name']) unless params['album']['name'].empty?"]
        expect(con_gen.create_new_belongs_to).to match_array(lines)
      end
    end
      
    describe "create_new_has_many" do
      it "returns code to add new instances of has_many properties" do
        lines = ["song_info.genres << Genre.create(name: params['genre']['name']) unless params['genre']['name'].empty?",
        "song_info.players << Player.create(name: params['player']['name']) unless params['player']['name'].empty?"]
        expect(con_gen.create_new_belongs_to).to match_array(lines)
      end
    end

    describe "redirect_show" do
      it "returns code to redirect to the current instance's show page" do
        line = 'redirect "song_infos/#{song_info.id}"'
        expect(con_gen.redirect_show).to eq(line)
      end
    end

    describe "erb_call(path)" do
      it "returns an erb command with the argument as the path" do
        expect(con_gen.erb_call('new')).to eq("erb :'/song_infos/new'")
      end
    end

    describe "clear_unhecked_params" do
      it "returns an array of code to clear out unchecked params" do
        lines = ["if !params[:song_info].keys.include?('genre_ids')
          params[:song_info]['genre_ids'] = []
        end",
        "if !params[:song_info].keys.include?('player_ids')
          params[:song_info]['player_ids'] = []
        end"]
        expect(con_gen.clear_unchecked_params).to match_array(lines)
      end
    end

  end

  describe "index_action" do
    it "returns code for an index route" do
      expect(con_gen.index_action).to eq(mock.index_action)
    end
  end

  describe "new_action" do
    it "returns code for a new route" do
      expect(con_gen.new_action).to eq(mock.new_action)
    end
    describe "new_action code" do
      it "stores instance variable containing all has_many and belongs_to objects" do
        # mock takes care of this. just for description and clarification
      end
    end
  end
  
  describe "create_action" do
    it "returns code for a create route" do
      expect(con_gen.create_action).to eq(mock.create_action)
    end
    describe "create_action code" do
      it "creates a new song from the params" do end
      it "creates and assigns new instances of belongs_to objects" do end
      it "creates and stores new instances of has_many objects" do end
      it "redirects to the new object's show page" do end
    end
  end
  
  describe "show_action" do
    it "returns code for a show action" do
      expect(con_gen.show_action).to eq(mock.show_action)
    end
  end
  
  describe "edit_action" do
    it "returns code for an edit action" do
      expect(con_gen.edit_action).to eq(mock.edit_action)      
    end
  end

  describe "patch_action" do
    it "returns code a patch_action" do
      expect(con_gen.patch_action).to eq(mock.patch_action)      
    end
    describe "patch_action code" do
      it "clears has_many if boxes are unchecked" do end
      it "finds the object to update" do end
      it "updates the object from the params" do end
      it "creates and assigns new instances of belongs_to objects" do end
      it "creates and stores new instances of has_many objects" do end
      it "redirects to the new object's show page" do end
    end
  end

  describe "delete_action" do
    it "returns code for a delete action" do
      
    end
    describe "delete action code" do
      it "finds the object" do end
      it "deletes the object" do end
    end
  end
end