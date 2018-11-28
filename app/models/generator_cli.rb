require_relative '../../config/environment'

class GeneratorCLI
  attr_accessor :generator

  def generate_class
    get_class_name
  end

  def get_class_name
    puts "Enter the name for your class"
  end

  def view_class_info(class_num)
    # stub
    # display classes
    # choose a class to view
  end

  def display_classes
    puts "Current classes:"
    # get and list the current classes that exist
  end

  def run
    display_classes
    puts "Enter 'class' to create a new class. Enter 'view [class number]' to view/edit a class's model."
    # display other input options
    input = gets.chomp
    if input == 'class'
      generate_class
    elsif num = input.split("view ")[1]
      if (n = num.to_i) > 0
        view_class_info(n)
      else 
        puts "Invalid input after 'view '."
        run
      end
    end
  end
end