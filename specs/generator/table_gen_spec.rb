require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

context "TableGenerator" do

  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist']
    end 
  }

  let(:table_gen) { TableGenerator.new.tap { |tg| 
      tg.class = cl 
    } 
  }


  describe "#initialize" do
    xit "initializes a TableGenerator with a GeneratorClass instance" do
      
    end  
  end

  describe "@class" do
    it "stores an instance of GeneratorClass" do
      expect(table_gen).to respond_to(:class)
      expect(table_gen.class.class).to eq(GeneratorClass)
    end
  end

  describe "#table_name" do
    it "generates and returns the name for the table" do
      expect(table_gen.table_name).to eq("song_infos")
    end
  end
  
  describe "#migration_name" do
    it "generates and returns the name for the migration" do
      expect(table_gen.migration_filename).to include("create_song_infos")
    end    
  end
  
  describe "#properties_columns" do
    it "returns an array with lines of code to create table columns for basic properties" do
      expect(table_gen.properties_columns).to include('t.string :name')
      expect(table_gen.properties_columns).to include('t.string :artist_name')
      expect(table_gen.properties_columns).to include('t.integer :duration_in_seconds')
    end
  end
  
  describe "#belongs_to_columns" do
    it "returns an array with lines of code to create belongs_to relationships" do
      expect(table_gen.belongs_to_columns).to include('t.integer artist_id')
    end
  end
  
  describe "#generate_migration" do
    it "creates all the code for the migration" do
      expect(false).to eq(true)
    end
    it "creates a migration file, named like an active record migration" do
      expect(false).to eq(true)
    end
    it "creates the file for the migration" do
      expect(false).to eq(true)
    end
  end

end