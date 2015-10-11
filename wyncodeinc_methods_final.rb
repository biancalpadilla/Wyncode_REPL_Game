module GameMethods
  ## Introduction to the game
  def intro
    puts "\nWelcome to Wyntropolis, a city inhabited by monsters
  and powered by the screams of coders in the human world."
  end

  ## Ask user to choose an option
  def ask(question = nil, options = nil)
  puts "#{question}\nType:#{options}"
  gets.chomp.downcase
  end

  ## Handle user input for monster name
  def handleMonsterInput(monster_input)
    case monster_input
    when "s", "sean"
       "Sean"
    when "g", "gabe", "gabriel"
      "Gabe"
    when "j", "johanna", "jo"
      "Johanna"
    when "r", "rita"
     "Rita"
    else
      "Monster"
    end
  end

  ## Directions
  def directions(monster_name)
    puts "\nHi #{monster_name}, you work as a \"Scarer\" for Wyncode, Inc.\nYour job is to venture into the coders's classrooms to\nscare them and collect their screams.", "\nFill your scream cannister to 100% to win!\nCaution: Don't get caught by Ed the Instructor!"
  end

  def start
    0
  end

  ## Scream Canister Scoring
  def screamCanScore(scream_canister = 0, screams = 0)
  puts "\nLast Round: #{scream_canister.round}%"
  puts "Earned/lost this Round: #{screams}%"
    total = scream_canister + screams
    if total < 0
      total = 0
      puts "Total: 0%"
    elsif total >= 100
      puts "Total: 100%"
      total = 100
    else
      puts "Total: #{total.round}%"
    end
  total
  end

  ## Scream Canister Visual
  def screamCanVisual(scream_canister)
    size = 20
    if scream_canister < 0
      puts "\n*Scream Canister*"
      puts "=" * size
      puts " "
      puts "=" * size
    else
      puts "\n*Scream Canister*"
      puts "=" * size
      puts "*" * (scream_canister.round * (0.01 * size))
      puts "=" * size
    end
  end

  ## Handle user input for scare tactic
  def handleScareTacticInput(scare_tactic_input)
    case scare_tactic_input
    when "r", "roar"
      "roar"
    when "s", "spooky noises", "spookynoises", "spooky noise", "noise", "spooky"
      "spooky noise"
    when "i", "invisibility", "invisible", "invisble"
      "invisibility"
    else "spooky noise"
    end
  end

  ## Say name of person and a message
  def say(name = nil, message)
    puts "  #{name}: #{message}"
  end

  ## Random Messages
  def randomRoar
    ["STANDUPSSSS!", "CONTROL FLOWWWWW!", "HASHESSSSSS!", "AGILEEE!", "ARAAYSSSS!", "RAILSSSSSS!"].sample
  end

  def randomSpookyNoise
    ["*whispers* 'infinite loop'", "*whispers* 'rm -r'", "*whispers* 'Cats in Hats'", "*whispers* 'Egyptian Pyramids HARD MODE'", "*whispers* '#WynterisComing'"].sample
  end

  def randomInvisible
    ["*Invisible*", "*Invisibly sips Panther Coffee*", "*Takes an invisible nap*" ].sample
  end

  def randomCoderAction
    ["coding", "lecture", "pairprogramming"].sample
  end

  def randomCoderName
    ["Adrian", "Alberto", "Arielle", "Bianca", "Carolina", "Christian", "Daniel B.", "Daniel F.", "Daniel M.", "David", "Giancarlo", "Guelmis", "Henry", "John", "Jose", "Jose C.", "Joe", "Josh", "Katherine", "Leif", "Maddie", "Matt R.", "Miguel", "Mikel", "Pablo", "Paola", "Stefanie", "Tim", "West", "Wilfredo"].sample
  end

  def randomPairProgrammer
    ["Adrian", "Alberto", "Arielle", "Bianca", "Carolina", "Christian", "Daniel B.", "Daniel F.", "Daniel M.", "David", "Giancarlo", "Guelmis", "Henry", "John", "Jose", "Jose C.", "Joe", "Josh", "Katherine", "Leif", "Maddie", "Matt R.", "Miguel", "Mikel", "Pablo", "Paola", "Stefanie", "Tim", "West", "Wilfredo"].sample
  end

  def randomScaredMaxMessage
    ["AAAAAAAHHHHHHHHHH!!!!!!", "OOOOMMMMGGG NOOOOOOO!", "PLEASEE DON\'T MAKE MEEEEE!!!!", "I DON'T WANT TOOO!"].sample
  end

  def randomScaredMidMessage
    ["TAAAAAA's, I think I heard something awful!", "Shit! What was that!", "Did anyoneee else hear that?!"].sample
  end

  def randomScaredMinMessage
    ["*cricket cricket*", "*nil*"].sample
  end

  # Meat of the game
  def handleScareTactic(monster_name, scare_tactic, scream_canister)
    roar = randomRoar
    spooky_noise = randomSpookyNoise
    invisible = randomInvisible
    scared_min_message = randomScaredMinMessage
    scared_mid_message = randomScaredMidMessage
    scared_max_message = randomScaredMaxMessage
    coder_action = randomCoderAction
    coder_name = randomCoderName
    pair_programmer = randomPairProgrammer
    screams = 0
    case coder_action
    when "coding"
      puts "\n#{coder_name} is quietly coding."
      if scare_tactic == "roar"
        say monster_name, roar
        say coder_name, scared_max_message
        screams += rand(6..10)
        rand(6..10)
      elsif scare_tactic == "spooky noise"
        say monster_name, spooky_noise
        say coder_name, scared_mid_message
        screams += rand(4..8)
        rand(4..8)
      elsif scare_tactic == "invisibility"
        say monster_name, invisible
        say coder_name, scared_min_message
        screams -= rand(3..5)
      elsif(scare_tactic != "roar" && scare_tactic != "spooky noise" && scare_tactic != "invisibility")
        puts "\nThat's not an option. Try again."
      end
    when "lecture"
    puts "\n#{coder_name} is in a lecture being taught by Ed"
    if scare_tactic == "roar"
      say monster_name, roar
      say coder_name, scared_max_message
      puts "OMG Ed heard you! You've lost screams."
      screams -= rand(4..8)
    elsif scare_tactic == "spooky noise"
      say monster_name, spooky_noise
      say coder_name, scared_mid_message
      puts "You were just quiet enough not to get caught by the Ed!"
      screams += rand(8..15)
    elsif scare_tactic == "invisibility"
      say monster_name, invisible
      say coder_name, scared_min_message
      puts "Neither Ed or #{coder_name} could see you!\nPoints for avoiding being caught!"
      screams += rand(1..5)
    elsif(scare_tactic != "roar" && scare_tactic != "spooky noise" && scare_tactic != "invisibility")
      puts "\nThat's not an option. Try again."
    end
    when "pairprogramming"
      puts "\nWorking together as pair programmer's,\n #{coder_name} and #{pair_programmer} are braver than ever!"
      if scare_tactic == "roar"
        say monster_name, roar
        say coder_name, scared_min_message
        puts "#{coder_name} called you out on your scare tactic!! Screams lost!"
        screams -= rand(3..4)
      elsif scare_tactic == "spooky noise"
        say monster_name, spooky_noise
        say coder_name, scared_min_message
        puts "#{coder_name} and #{pair_programmer} are not shaken up! Screams lost!"
        screams = rand(3..4)
      elsif scare_tactic == "invisibility"
        say monster_name, invisible
        say coder_name, scared_min_message
        puts "Great job staying silent or #{coder_name} and #{pair_programmer} would've called you out!"
        screams += rand(10..14)
      elsif(scare_tactic != "roar" && scare_tactic != "spooky noise" && scare_tactic != "invisibility")
        puts "\nThat's not an option. Try again."
      end
    end
  end
end