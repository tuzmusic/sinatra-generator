require_relative '../spec_helper'
Dir[File.join(File.dirname(__FILE__), "../../generator/app/models", "*.rb")].each {|f| require f}

describe "ModelReader" do
  
  let(:reader) { ModelReader.new }

  it "reads a single class file and creates a GeneratorClass object" do end

end