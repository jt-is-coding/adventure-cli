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
        #run create_adventurer method here
      elsif choice == "2" || choice == "two" || choice == "load my adventurer"
        #run load_adventurer
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
    puts "Here are some available jobs for #{self.name}."
    puts "1. Busy Bee Keeper"
    puts "2. Polly-Picks-Your-Pocket"
    puts "3. Sludgemancer"
  
