require File.join(File.expand_path(File.dirname(__FILE__)), 'engine')

class Game
  def initialize(bootstrap)
    @engine = engine.new(bootstrap.controller)
    @engine.splash_message = bootstrap.splash_message
  end
  
  def play
    @engine.start
  end
  
  def engine
    Engine
  end
end