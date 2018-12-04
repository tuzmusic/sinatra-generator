require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

describe "SiteGenerator" do
  
  let(:sg) { SiteGenerator.new }

  describe "generate_generator_classes" do
    it "creates a GeneratorClass object for each class in the models folder and stores them in the @classes array" do
      sg.generate_generator_classes
      expect(sg.classes.count).to eq(Dir["app/models/*.rb"].count)
    end

    describe "generate_migrations" do
      it "creates migration files for each class" do
        sg.generate_generator_classes
        sg.generate_migrations
        expect(Dir["db/migrate/*.rb"].count).to eq(Dir["app/models/*.rb"].count)
      end    
    end
  end
end