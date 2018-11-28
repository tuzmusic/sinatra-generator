require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../app/models", "*.rb")].each {|f| require f}

context 'GeneratorCLI' do

  let(:cli) { GeneratorCLI.new }  
  before do
    allow($stdout).to receive(:puts)
  end

  it "has a Generator object" do
    expect(cli).to respond_to(:generator)
  end

  describe "run" do

    it "allows user to type 'class' to start creating a new class" do
      allow(cli).to receive(:gets).and_return 'class'
      expect(cli).to receive(:generate_class)
      cli.run
    end

    it "allows user to type 'view' to view info about a class" do
      allow(cli).to receive(:gets).and_return 'view 1'
      expect(cli).to receive(:view_class_info).with(1)
      cli.run
    end   

    xit "asks for input again if view is called with incorrect arguments" do
      
    end
  end

  describe 'get_class_name' do
    it "asks for the name of the class to create" do
      expect($stdout).to receive(:puts).with("Enter the name for your class")
      cli.get_class_name
    end
    
    it "stores the name in the @class_name property" do
      expect false.to_be true
    end

    it "allows user to type 'done' to exit class input" do
      expect false.to_be true
    end   
  end
  
  describe "get_relationships(class_name)" do
    it "asks for the names of classes the class belongs to" do
      expect false.to_be true
    end
    
    it "asks for the names of classes the class has_many of" do
      expect false.to_be true
    end
    
    it "asks for the names of classes the class has_many through" do
      expect false.to_be true
    end
    
    xit "lists existing classes" do
      expect false.to_be true
    end
    
    it "allows user to choose from existing classes" do
      expect false.to_be true
    end

    it "allows user to type 'done' to exit each relationship input" do
      expect false.to_be true
    end    

    it "stores each relationship in the @relationships array" do
      expect false.to_be true
    end
  end
  
  describe "generate" do
    it "sets Generator object properties from instance variables" do
      expect false.to_be true
    end

    it "calls Generator#generate to start the big process" do
      expect false.to_be true
    end
  end
  
end