require "./adventurer"

class Adventure
  attr_accessor :successful_adventurers, :new_guy, :bumbling_knight_complete, :sludgemancer_complete

  def initialize
    @successful_adventurers = []
    @new_guy = Adventurer.new("", "")
    @bumbling_knight_complete = false
    @sludgemancer_complete = false
  end

  def new_adventurer(name, job)
    @new_guy = Adventurer.new(name, job)
  end

  def create_adventurer
    puts "A new Adventurer, huh? Sure thing."
    puts "What are we callin this Adventurer?"
    input_name = gets.upcase.chomp
    puts "#{input_name}, got it."
    loop {
      puts "Here are some available jobs for #{input_name}."
      puts "1. Bumbling Knight"
      puts "2. Sludgemancer"
      input_job = gets.chomp
      if input_job == "1"
        input_job = "the BUMBLING KNIGHT"
        new_guy = new_adventurer(input_name, input_job)
        beginning
        break
      elsif input_job == "2"
        input_job = "the SLUDGEMANCER"
        new_adventurer(input_name, input_job)
        beginning
        break
      else
        puts "Sorry, that job is taken."
      end
    }
  end

  def train
    push_ups = 0
    puts "You decide to train."
    while push_ups < 10 
      puts "Do a 'PUSH-UP'!"
      input = gets.chomp
      if input == "PUSH-UP"
        push_ups = push_ups + 1
      elsif input == "push-up"
        puts "No, no, with FEELING. Now again:"
      elsif input == "fast forward"
        push_ups = 10
      else
        puts "Huh? I said:"
      end
    end
  end
  
  def beginning
    if new_guy.job == "the BUMBLING KNIGHT"
      pass = false
      guards = false
      fired = false
      puts "\n"
      puts "You are #{new_guy.name} #{new_guy.job}."
      puts "The Queen of Bustleburg has been disatisfied with your performance lately."
      puts "Between sleeping on the job and failure to accomplish even the simplest of tasks, your job is at risk."
      puts "The Queen is giving you one last chance to deliver. You are to find her misplaced Royal Scepter."
      puts "..."
      puts "Or else."
      loop {
        if fired == true
          break
        end
        puts "Where will you search?"
        puts "1. The castle bar"
        puts "2. The Queen's living chambers"
        puts "3. The Knights' sleeping quarters"
          sk_choice_one = gets.downcase.chomp
          if sk_choice_one == "1"
            puts "You head down to the castle bar. Plenty of weary knights spend free time here, maybe one of them would know something?"
            puts "You spy a gnarled knight resting their weary bones while partaking in a tankard of ale."
            loop {
              puts "What would you like to do?"
              puts "1. Talk to the gnarled knight"
              puts "2. Buy some ale"
              puts "3. Leave"
              sk_bar_choice = gets.downcase.chomp
              if pass == true && sk_bar_choice == "1" 
                puts "The knight has nothing more to say to you."
                puts "\n"
              elsif sk_bar_choice == "1"
                puts "The knight groans, having had a long, boring day of guarding the Queen's living chambers."
                puts "Only well-liked, trusted knights are given such a duty. It may be easy, but many knights grow tired of it quickly."
                puts "Thinking it could come in handy, you ask the knight if they could give you written permission to guard the chambers in exchange for another drink."
                puts "The knight agrees and scribbles on a bar napkin."
                puts "\n"
                pass = true
              elsif sk_bar_choice == "2"
                puts "You buy some ale, forgetting all about your duty to the Queen."
                puts "Unsurprisingly, you're fired when the Queen finds out that you'd been slacking on the job *again*."
                puts "Try again, will ya?"
                puts "\n"
                fired = true
                break
              elsif sk_bar_choice == "3"
                puts "You leave the bar and resume your search."
                puts "\n"
                break
              else
                puts "How about you pick one of these options:"
              end
              }
          elsif sk_choice_one == "2"
            puts "You mosey on down the to Queen's living chambers."
            if pass == false
              puts "The knight stationed there shoos you away, as you have no business in the area."
            else
              puts "You show the knight stationed at the chambers your bar scribbles. They laugh at you, stating they don't care that some other knight gave you permission."
              puts "There is a pause. Being presented with the idea of leaving and doing anything else, the knight decides to let you take their post anyway."
              puts "Once the other knight is out of sight, you enter the chambers and begin your search for the scepter."
              puts "..."
              puts "No luck, however. You head back to resume your search elsewhere."
              puts "\n"
              guards = true
            end
          elsif sk_choice_one == "3"
            "You saunter to your familiar sleeping quarters."
            if guards == false
              puts "Upon laying your eyes on your trusty bed, you decide that a short nap couldn't possibly hurt..."
              puts "...\n...\n..."
              puts "It did, however, as you were fired immediately upon waking up, having slept the rest of the day away."
              puts "Give it another go, I bet you'll get it next time."
              fired = true
            else
              puts "Upon laying your eyes on your trusty bed, you decide that a short nap couldn't possibly hurt..."
              puts "But the knight you sent away at the Queen's living chambers is here as well, and you'd rather not get caught napping on the job."
              puts "Oh, and hey look, it's the Queen's Royal Scepter, over there in the corner. Looks like someone had been polishing it."
              puts "You swipe the scepter and return to the Queen."
              puts "Deciding it best *not* to tell the Queen that she simply forgot she'd given it to another knight for polishing, you regale her with a made-up tale of how you recovered the scepter."
              puts "Your tale impresses the Queen greatly, and your job is safe for another day!"
              puts "\nHey, you did it! Nice!"
              fired = true
              successful_adventurers.push("#{new_guy.name} #{new_guy.job}")
              self.bumbling_knight_complete = true
            end
          else
           puts "Wait, I didn't catch that. Lemme ask again:"
          end
      }

    elsif new_guy.job == "the SLUDGEMANCER"
      give_up = false
      push_ups = 0
      puts "\n"
      puts "You are #{new_guy.name} #{new_guy.job}."
      puts "Your home is a vile place known only as the Sludge Pit. A place where the sun's light never shines, and people live strange little lives."
      puts "..."
      puts "And by people I mean *you*. No one else lives here. I mean, seriously, the Sludge Pit? Who else but a Sludgemancer would live here?"
      puts "And Sludgemancy? Out of all the types of magic it's got to be the worst. What good is a class of magic that focuses on producing sludges???"
      puts "Sure the idea was a little funny, but now every time you sneeze you accidentally fire off a sludge spell, adding more muck to the Sludge Pit. It's just kinda unpleasant."
      loop{
        if give_up == true
          break
        else
          puts "Are you sure you want to be a Sludgemancer?"
          puts "1. No, this sounds awful. Please get me out of here."
          puts "2. Yes. I'm oddly intrigued by all this sludge talk. I need to see where this is going."
          sludgemancer_choice = gets.chomp
          if sludgemancer_choice == "1"
            puts "Okay, cool, let's get out of here."
            puts "\n"
            break
          elsif sludgemancer_choice == "2"
            puts "Ugh, FINE. We'll do the dang Sludgemancer stuff."
            puts "You are #{new_guy.name} #{new_guy.job}."
            puts "Your home is a vile place known only as the Sludge Pit. A place where the sun's light never shines, and people live strange little lives."
            puts "The annual Sludgemancy Muck Mountain Challenge is coming up, a contest to see which Sludgemancer can produce the largest pile of mud."
            rival = new_guy.name.reverse
            puts "You have never won. Your rival, #{rival}, is undefeated. But maybe this year will be different..."
            loop {
              puts "Any ideas on how you're gonna pull out a big win this year?"
              puts "1. Train hard, devote body and mind entirely to the sludge. This will surely lead to victory."
              puts "2. Cheat. Sabotage #{rival}. Playing fair has never worked."
              puts "3. Give up."
              sludgemancer_choice2 = gets.chomp
              if sludgemancer_choice2 == "1"
                train
                puts "After 10 days of vigorous physical activity, your Sludgemancy somehow improved."
                puts "...\n...\n..."
                puts "Not entirely sure what the correlation is there...but hey, can't argue with results, right?"
                puts "The day of the Challenge arrives, and your hard work paid off! #{rival}'s sludge pile was miniscule compared to yours."
                puts "After all these years, you finally managed to wipe that smug grin from #{rival}'s face, and you bask in the glory of a hard-fought victory."
                puts "\nNice! You sure showed that jerk, #{rival}!"
                successful_adventurers.push("#{new_guy.name} #{new_guy.job}")
                self.sludgemancer_complete = true
                give_up = true
                break
              elsif sludgemancer_choice2 == "2"
                puts "You spend the time before the Challenge scheming and plotting, rather than honing your craft."
                puts "...\n...\n..."
                puts "And it paid off! You decided it would be easiest if you slashed #{rival}'s tires the night before the Challenge."
                puts "Everyone knows you cheated though, so you feel a little hollow."
                puts "*Sigh*, if only you had put in the effort. You'd probably feel a little better about your victory."
                puts "Oh well! A win is a win in the Sludge Pit, I guess."
                puts "\nNice! You sure showed that jerk, #{rival}!"
                successful_adventurers.push("#{new_guy.name} #{new_guy.job}")
                self.sludgemancer_complete = true
                give_up = true
                break
              elsif sludgemancer_choice2 == "3"
                puts "You give up, who cares about winning the dumb Sludgemancy Muck Mountain Challenge anyway..."
                puts "...\n...\n..."
                puts "Well, you do. Just a little. Mostly because you want to wipe that smug grin off of #{rival}'s face."
                puts "Better luck next time!"
                puts "\n"
                give_up = true
                break
              else
                puts "I didn't quite catch that. Let's run that back:"
              end
            }
          else
            puts "What was that? I'll ask again:"
          end
        end
        }
    end
  end
  
  def adventure_start
    puts "Hiya! This is AdventureCLI."
    puts "Real quick, what's your name?"
    user_name = gets.capitalize.chomp
    puts "Okay, cool. Thanks!"
    loop {
    if @bumbling_knight_complete == false || @sludgemancer_complete == false
      puts "Select an option!"
      puts "1. Create an Adventurer"
      puts "2. Load my Adventurer"
      puts "3. Exit"
      choice = gets.downcase.chomp
        if choice == "1" || choice == "one" || choice == "create a new adventurer"
          create_adventurer
        elsif choice == "2" || choice == "two" || choice == "load my adventurer"
          if new_guy.name == ""
            puts "There's no Adventurer to load, buddy."
            puts "\n"
          else
            puts "Welcome back, #{new_guy.name} #{new_guy.job}!"
            beginning
         end
        elsif choice == "3" || choice == "three" || choice == "exit"
         puts "Sure. See ya later!"
          break
        else
          puts "Maybe you didn't hear me? I said:"
        end
    else
      puts "\nWow! You finished both intense, lengthy campaigns!
Thank you for your courage, #{successful_adventurers.at(0)} and #{successful_adventurers.at(1)}!
And of course thank you #{user_name}, for playing all the way through! Have a nice day!"
      break
    end
    }
  end

end
  
