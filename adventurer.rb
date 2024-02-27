class Adventurer
  attr_accessor :name, :job

  def initialize
    @name = name
    @job = job
  end

  def adventure_start
    #puts "\n"
    puts "Hiya! This is AdventureCLI."
    puts "So...what's the plan?"
    gets.chomp
    puts "Oh, uh. Yeah, I don't really feel like doing that right now."
    loop {
    puts "How about one of these?"
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
      puts "1. Slacker Knight"
      puts "2. Polly-Picks-Your-Pocket"
      puts "3. Sludgemancer"
      job_choice = gets.downcase.chomp
      if job_choice == "1" || job_choice == "one" || job_choice == "slacker knight"
        self.job = "Slacker Knight"
        break
      elsif job_choice == "2" || job_choice == "two" || job_choice == "polly-picks-your-pocket"
        self.job = "Polly-Picks-Your-Pocket"
        break
      elsif job_choice == "3" || job_choice == "three" || job_choice == "sludgemancer"
        self.job = "Sludgemancer"
        break
      else
        puts "Sorry, that job is taken."
      end
    }
  end

  def beginning
    if self.job == "Slacker Knight"
      puts "\n"
      puts "You are #{self.name} the #{self.job}."
      #puts "Queen "
      puts ""
      puts "..."
      puts "Or else."
      puts "Where will you begin your search?"
      puts "1. The castle bar where tired knights "
      puts "2. The Queen's living chambers"
      puts "3. "
end
  
