## OVERALL APPROACH
  - Avoid dependency injection in the style from Lucas Penzey's blog post -->
      bc it can get really messy
  - Instead, use protocols and behaviors for polymorphism.

## POLYMORPHISM - 2 WAYS
  ### Behaviors
    Create interfaces for modules. 

  ### Protocol
    Create interfaces for data types (or functions?) so that functions behave differently based on the data type passed to them.
    Structs are used to define custom data types.

## LOG STRING IN ELIXIR?
    Ruby way was all side effects - good for testing situations w/ no return value, but we need something different here.
    Elixir Option:
      Define a protocol that, when it receives a TestGame data type, it prints out messages instead of / in addition to
        executing the functionality.

## TESTING PLAN
  ### Acceptance Test
    Start there
    It will provide more value as the app gets bigger
    Just a litmus test, doesn't help with design decisions

  ### Try testing that everything gets called
    Forced into using protocols because now there are multiple uses for a given duck type
    Puts you in an open-closed position
    Don't spend too much time on this though

## Goal 
    Game is one data structure and you're threading it through everything
    
    Game holds the state for the game (board, current player), and also the protocols / implementations? 


  ### How-To
    When you pass in a test game struct to each protocol (?),
    it does something totally different than if you pass in a real game struct
    like logging the event rather than printing to the console.


## NEW PLAN

  ### Finish Displaying Board
    - Test and build BoardPresenter module (instead of Board)
    - Wire up the real Presenter in the EScript
    - Delete the extra stuff


## Mix escript.build before testing

  - Removed ```Mix.Shell.Process.cmd("mix escript.build")``` from acceptance test (above other shell process command)
  - Not having any issues running the tests atm
  - If something happens, try:
    - adding aliases: aliases() to mix.exs project fn
    - creating an aliases fn in mix.exs (see docs about augmenting existing tasks[https://hexdocs.pm/mix/1.13/Mix.html#module-aliases])
      defp aliases do
        [
          test: ["escript.build", "test"]
        ]
      end


## WIP Stopping Point 7/14

  - Considering whether to make the board a list for ease of updating
  - Could add a get_space function in a board module instead - probably better for O-C principle
  - Then just need to finish updating the board based on user input



  - Do I need to test that the correct message is getting displayed to the console in the unit test? 
  - How do I give get_input access to state.messages? 


  Goal:
  . Make an assertion about the correct prompt (error or not) being printed to the console
  . Change get_input so it records the prompts printed out in "messages"
  

  Steps: 
  . Write a new test that makes an assertion on messages. 
  . Back up: change other tests so that get_input returns state that includes a current_move field
  . Expand and contract to keep tests green: 
    . Make a new get_input function that uses the different functionality


  *** Fix UI record_messages so that it records them in the right order (do enum_reverse after all msgs have been recorded, not inside the record_messages fn itself)

  Problem:
  - Player.move returns a number corresponding to a space, but the board keys are tuples and it doesn't make sense to access the board space by the map's value instead of its key. 

  Goal:
  Decide between some optins: 
  ** Change the board keys to be numbers instead of coordinates
  - Tried changing board to a list didn't work because it's really hard to cherry pick list items
  - Make a method that converts numerical input into a tuple so the board state can understand it? 
    - What's the point of having coordinates in a situation where all modules have equal access to and knowledge of the board state?

  Goal:
  Change the board keys to be numbers instead of coordinates. 

  Steps: 
  - When is the board state accessed?
    x Presenter.present (& test)
    x Player.move (& test)
    x When it's initially passed to the program
      - integration test
      - acceptance test
      - real startup