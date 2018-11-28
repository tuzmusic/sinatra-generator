require_relative '../../config/environment'

class GeneratorCLI
  attr_accessor :generator

  def generate_class
    binding.pry
  end
  
  def view_class_info
    # stub
    # display classes
    # choose a class to view
  end

  def run
    puts "Enter 'class' to create a new class."
    # display other input options
    input = gets.chomp
    case input
    when "class"
      generate_class
    when "view"  
      view_class_info
    end
  end
end