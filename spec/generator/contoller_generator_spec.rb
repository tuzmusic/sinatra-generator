require_relative '../spec_helper'

describe "ControllerGenerator" do
  
  let(:con_gen) { ControllerGenerator.new.tap do |cg|
      cg.class = cl
    end
  }

  it "has a @class property that stores a GeneratorClass instance" do
    expect(con_gen).to respond_to(:class)
    expect(con_gen.class.class).to eq(GeneratorClass)
  end

  describe "index_action" do
    
  end
end