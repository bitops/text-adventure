require 'readline'

class Engine
  attr_accessor :splash_message
  
  def initialize(controller)
    @ctl = controller
  end

  def repl
  	puts @ctl.current_message
  	puts 
  	input = read_line
  	@ctl.evaluate(input)
  	repl
  end  
  
  def read_line
    Readline.readline('> ', true)
  end
  
  def start
    # Print splash message
    puts @splash_message
    # Start the game loop
    repl
  end
  
end