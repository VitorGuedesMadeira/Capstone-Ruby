class Greetings
  def self.greetings
    puts '________________________________________________'
    puts '        _                                       '.colorize(color: :blue).bold
    puts '  /\\/\\ (_) ___ _ __ _____   _____ _ __ ___  ___ '.colorize(color: :blue).bold
    puts " /    \\| |/ __| '__/ _ \\ \\ / / _ \\ '__/ __|/ _ \\".colorize(color: :blue).bold
    puts '/ /\\/\\ \\ | (__| | | (_) \\ V /  __/ |  \\__ \\  __/'.colorize(color: :blue).bold
    puts '\\/    \\/_|\\___|_|  \\___/ \\_/ \\___|_|  |___/\\___|'.colorize(color: :blue).bold
    puts "\nWelcome to my catalog!".colorize(color: :blue).bold
  end
end
