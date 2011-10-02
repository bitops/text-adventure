require 'readline'

GAME_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require File.join(GAME_ROOT, 'lib', 'avatar')
require File.join(GAME_ROOT, 'lib', 'room')
require File.join(GAME_ROOT, 'lib', 'input_controller')
require File.join(GAME_ROOT, 'lib', 'game_data_loader')

location_data_file = File.absolute_path(File.join(GAME_ROOT, "#{ARGV[0]}"))
message_data_file = File.absolute_path(File.join(GAME_ROOT, "#{ARGV[1]}"))

ARGV.clear

class Engine
  def initialize(location_data_file, message_data_file)
    # TODO: this should move out of the engine. data should be passed in pre-loaded.
    @loader = GameDataLoader.new
    # TODO: this should be injected into the engine also.
    @ctl = InputController.new
    locations = load_locations(location_data_file)
    messages = load_messages(message_data_file)
    @splash_message = messages["splash"]
    starting_location = locations.find {|location| location.starting_location?}
    initialize_controller messages, Avatar.new(starting_location)
  end
  
  def load_locations(location_data_file)
    @loader.load_location_data(location_data_file)
  end
  
  def load_messages(message_data_file)
    @loader.load_message_data(message_data_file)
  end
  
  def initialize_controller(messages, avatar)
    @ctl.messages = messages
    @ctl.avatar = avatar
    @ctl.initialize_message
  end

  def repl
  	puts @ctl.current_message
  	puts 
  	input = Readline.readline('> ', true)
  	@ctl.evaluate(input)
  	repl
  end  
  
  def start
    # Print splash message
    puts @splash_message
    # Start the game loop
    repl
  end
  
end

# main
Engine.new(location_data_file, message_data_file).start