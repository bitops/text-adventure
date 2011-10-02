require File.join(File.expand_path(File.dirname(__FILE__)), 'engine')

class Game
  def initialize(bootstrap)
    @engine = Engine.new(bootstrap.controller)
    @engine.splash_message = bootstrap.splash_message
  end
  
  def play
    @engine.start
  end
end