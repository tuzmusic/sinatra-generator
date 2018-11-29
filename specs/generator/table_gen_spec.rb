require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

describe "TableGenerator" do

  let(:class) { GeneratorClass.new.tap do |cl|
    cl.name = "SongInfo"
    cl.properties = [ {name: 'name', type: 'string'},
                      {name: 'artist_name', type: 'string'},
                      {name: 'duration_in_seconds', type: 'integer'} ]
    cl.belongs_to = ['Artist']
    end 
  }

  let(:table_gen) { TableGenerator.new.tap {|tg| tg.class = :class}}
  
  describe "#initialize" do
    xit "initializes a TableGenerator with a GeneratorClass instance" do
      
    end  
  end

  describe "@class" do
    it "stores an instance of GeneratorClass" do
      expect(:table_gen).to_respond_to(:class)
      expect(:table_gen.class).to_be_an_instance_of(GeneratorClass)
    end
  end

  describe "#table_name" do
    it "generates and returns the name for the table" do
      expect false.to_be true
    end
  end
  
  describe "#migration_name" do
    it "generates and returns the name for the migration" do
      expect false.to_be true
    end    
  end
  
  describe "#properties_columns" do
    it "returns an array with lines of code to create table columns for basic properties" do
      expect false.to_be true
    end
  end
  
  describe "#belongs_to_columns" do
    it "returns an array with lines of code to create belongs_to relationships" do
      expect false.to_be true
    end
  end
  
  describe "#generate_migration" do
    it "creates all the code for the migration" do
      expect false.to_be true
    end
    it "creates a migration file, named like an active record migration" do
      expect false.to_be true
    end
    it "creates the file for the migration" do
      expect false.to_be true
    end
  end

end