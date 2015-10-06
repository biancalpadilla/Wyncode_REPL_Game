require "./wyncodeinc_methods_final.rb"
include GameMethods
begin
  intro
  monster_input = ask("\nChoose a Monster", "\tS for Sean\n\tG for Gabe\n\tJ for Johanna\n\tR for Rita")
  monster_name = handleMonsterInput(monster_input)
  directions(monster_name)
  scream_canister = start
  screamCanVisual(scream_canister)
  begin
    scare_tactic_input = ask("\nChoose a scare tactic?", "\tR for Roar\n\tS for Spooky Noise\n\tI for Invisibility")
    handleScareTacticInput(scare_tactic_input)
    scare_tactic = handleScareTacticInput(scare_tactic_input)
    screams = handleScareTactic(monster_name, scare_tactic, scream_canister)
    scream_canister = screamCanScore(scream_canister, screams)
    screamCanVisual(scream_canister)
  end until scream_canister == 100
  play_again = ask("Would you like to play again?", "\tY for Yes\n\tN for No")
end until play_again != "y"
