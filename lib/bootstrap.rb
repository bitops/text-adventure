lib_dir = File.expand_path(File.dirname(__FILE__))

require File.join(lib_dir, 'avatar')
require File.join(lib_dir, 'input_controller')
require File.join(lib_dir, 'game_data_loader')

class Bootstrap
  def initialize(location_data_file, message_data_file)
    @locations = loader.load_location_data(location_data_file)
    @messages = loader.load_message_data(message_data_file)
  end
  
  def starting_location
    @locations.find {|location| location.starting_location?}
  end
  
  def avatar
    Avatar.new(starting_location)
  end
  
  def loader
    @loader ||= GameDataLoader.new
  end
  
  def controller
    ctl = InputController.new
    ctl.messages = @messages
    ctl.avatar = avatar
    ctl.initialize_message
    ctl
  end
  
  def splash_message
    @messages["splash"]
  end
end