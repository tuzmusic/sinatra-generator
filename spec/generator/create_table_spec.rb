require_relative '../spec_helper'

context "TableGenerator" do

  let(:cl) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist']
    cl.has_many = ['SongGenre']
    cl.many_through_join = { many: 'Genre', through: 'SongGenre' }
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
  
  describe "#create_table_filename" do
    it "generates and returns the name for the migration" do
      expect(table_gen.create_table_filename).to include("create_song_infos")
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
      expect(table_gen.belongs_to_columns).to include('t.integer :artist_id')
    end
  end  
  
  describe "#generate_create_table_migration" do
    it "creates the file for the migration" do
      expect{
        table_gen.generate_create_table_migration
      }.to change{
        Dir["db/migrate/*"].length
      }.by(1)
    end
  end

  describe "#create_table_code" do
    it "creates all the code for the migration" do
      path = "fixtures/migration_song_infos.rb"
      expect(table_gen.create_table_code).to eq(File.read(path))
    end    
  end 
end