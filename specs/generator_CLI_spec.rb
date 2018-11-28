require 'spec_helper'

context 'GeneratorCLI' do
  it "has a Generator object" do
    expect false.to_be true
  end

  describe "run" do
    it "allows user to type 'class' to start creating a new class" do
      expect false.to_be true
    end
    it "allows user to type 'view' to view info about a class" do
      expect false.to_be true
    end   
  end

  describe 'get_class_name' do
    it "asks for the name of the class to create" do
      expect false.to_be true
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
  
  describe "view" do
    it "lists existing classes" do
      expect false.to_be true
    end

    it "allows user to select a class by number" do
      expect false.to_be true
    end

    it "shows the relationships in that clas" do
      expect false.to_be true
    end

    it "allows user to type 'edit' to edit the class being displayed" do
      expect false.to_be true
    end

    it "allows user to type 'done' to return to the main prompt" do
      expect false.to_be true
    end

  end

  describe "generate" do
    it "sets Generator object properties from instance variables" do
      expect false.to_be true
    end
  end
  
end