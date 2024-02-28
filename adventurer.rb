class Adventurer
  attr_accessor :name, :job

  def initialize
    @name = name
    @job = job
  end

  def adventure_start
    #puts "\n"
    puts "Hiya! This is AdventureCLI."
    loop {
    puts "Select an option!"
    puts "1. Create an Adventurer"
    puts "2. Load my Adventurer"
    puts "3. Exit"
    choice = gets.downcase.chomp
      if choice == "1" || choice == "one" || choice == "create a new adventurer"
        create_adventurer
        #break
      elsif choice == "2" || choice == "two" || choice == "load my adventurer"
        if self.name == nil
          puts "There's no Adventurer to load, buddy."
        else
          puts "Welcome back, #{self.name} the #{self.job}!"
          beginning
        end
        #break
      elsif choice == "3" || choice == "three" || choice == "exit"
        puts "Sure. See ya later!"
        break
      else
        puts "Maybe you didn't hear me? I said:"
      end
    }
  end

  def create_adventurer
    puts "A new Adventurer, huh? Sure thing."
    puts "What are we callin this Adventurer?"
    self.name = gets.chomp
    puts "#{self.name}, got it."
    loop {
      puts "Here are some available jobs for #{self.name}."
      puts "1. Bumbling Knight"
      puts "2. Sludgemancer"
      job_choice = gets.downcase.chomp
      if job_choice == "1" || job_choice == "one" || job_choice == "bumbling knight"
        self.job = "Bumbling Knight"
        beginning
        break
      elsif job_choice == "2" || job_choice == "two" || job_choice == "sludgemancer"
        self.job = "Sludgemancer"
        beginning
        break
      else
        puts "Sorry, that job is taken."
      end
    }
  end

  def beginning
    if self.job == "Bumbling Knight"
      pass = false
      guards = false
      fired = false
      puts "\n"
      puts "You are #{self.name} the #{self.job}."
      puts "The Queen of Bustleburg has been disatisfied with your performance lately."
      puts "Between sleeping on the job and failure to accomplish even the simplest of tasks, your job is at risk."
      puts "The Queen is giving you one last chance to deliver. You are to find her misplaced Royal Scepter."
      puts "..."
      puts "Or else."
      loop {
        if fired == true
          puts "\n"
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
              puts "..."
              puts "..."
              puts "..."
              puts "It did, however, as you were fired immediately upon waking up, having slept the rest of the day away."
              puts "Give it another go, I bet you'll get it next time."
              fired = true
            else
              puts "Upon laying your eyes on your trusty bed, you decide that a short nap couldn't possibly hurt..."
              puts "But the knight you sent away at the Queen's living chambers is here as well, and you'd rather not get caught napping on the job."
              puts "Oh, and hey look, it's the Queen's Royal Scepter, over there in the corner. Looks like someone had been polishing it."
              puts "You swipe the scepter and return to the Queen."
              puts "Deciding it best to remind the Queen that she'd given the scepter to another knight for polishing, you hand it to her with pride."
              puts "The Queen is pleased with your hard work, and you go on to work another day."
              puts "Congrats, you win!"
              fired = true
            end
          else
           puts "Wait, I didn't catch that. Lemme ask again:"
          end
      }
    elsif self.job == "Sludgemancer"
      puts "Sludgemancer start!"
    end
  end
end
  
