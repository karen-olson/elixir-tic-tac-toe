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