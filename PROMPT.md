Let us introduce some game state.

We will use Ruby's built-in `PStore` library to do the persistence.

We wish to introduce a notion of a `GameSession`.

A `GameSession` is the owner of all other state within a session - `Inventory`, `Location`, and so on.

A `Location` is a `Room`.

When you `start` a new `GameSession`, a new `GameSession` is created and serialized to disk using `PStore`.

When `start` a new `GameSession`, an empty `Inventory` with no `InventoryItem` in it is initialized and attached to the `GameSession`. A `GameSession` has one `Inventory`. `Inventory` has many `InventoryItem`.

Make sure to sketch data structures in ERD with Mermaid.

We will use the `GameSession` to create the following enhancement to the CLI. We want to be able to play through a game from the command line, one command at a time.

Example flow:

```bash
$ ./game new "BlueSession"
$ ./game play "BlueSession"
An Epic Adventure awaits you. Type 'help' for instructions.
A beautiful lake surrounded by trees.

$ ./game status
Playing: "BlueSession"
* BlueSession set as default

$ ./game play "hep"
Sorry, that is not a valid command.

$ ./game play "help"
Type 'look' for more information. You can 'go <direction>' to move around. Type 'exit' or 'quit' to stop the game.
Type 'inventory' to see your inventory.

$ ./game play "inventory"
- Inventory -
(empty)

$ ./game play "look"
A trail runs to the north from here.

$ ./game play "go north"
A forest full of lush trees.

$ ./game play "look"
The path splits. To the west lies your home. To the east are the mountains. Back to the south is a lake.

$ ./game play "go west"
Your home. It is a happy house.

$ ./game play "look"
Your house is here. It is a quiet place. To the east is the path in the forest. If you go west you will enter your house.

$ ./game play "go west"
You are standing in the main room of your house.

$ ./game play "look"
The inside of your house is simple but clean and quiet. You have spent many happy hours here. The study is in the north room.

$ ./game play "go north"
You are in your study. It is a clean room with a desk and windows facing outside.

$ ./game play "look"
Your study is where your work gets done. There is a letter on your desk.

$ ./game play "take letter"
You take the letter from the desk.

$ ./game play "inventory"
- Inventory -
* Letter
```

When a new `GameSession` starts, make a copy of the data in `data/epic_adventure` and store as a pstore `GameSession`.

## Implementation Notes

Make sure to add lots of tests. Use the existing MiniTest tests in `tests`. Ensure that there is shell script tooling that can run all the tests with a single command. Ensure also that there is shell script tooling that can run a single test in isolation.

Work in a test-first manner.

## Core Change

The core change I want to make to support this is as follows. See below sketch:

This is just an idea and the actual implementation doesn't have to follow. It's just trying to connect the example play through session with the code.

```ruby
# lib/engine.rb
require 'readline'

class Engine
  attr_accessor :splash_message

  def initialize(controller, input_mode)
    @ctl = controller
    @input_mode = input_mode # :repl or :one_shot
  end

  # TODO: possibly this should be a whole separate method
  def repl
    if @input_mode == :repl
      puts @ctl.current_message
      puts
    	input = read_line
    	@ctl.evaluate(input)
  	  repl
    else
      input = read_input
    	@ctl.evaluate(input)
      puts @ctl.current_message
    end
  end

  def read_line
    Readline.readline('> ', true)
  end

  def read_input
    # TODO: get input from command line here
  end

  def start
    # Print splash message
    puts @splash_message
    # Start the game loop
    repl
  end

end
```
