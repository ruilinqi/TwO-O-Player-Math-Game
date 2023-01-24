require './question.rb'
require './player.rb'

class Game

  def initialize
    puts "What's name of player 1?"
    player1 = gets.chomp
    @player1 = Player.new(player1)

    puts "What's name of player 2?"
    player2 = gets.chomp
    @player2 = Player.new(player2)

    @current_player = @player1

  end

  def change_player
    if @current_player.name == @player1.name
       @current_player = @player2
    else
      @current_player = @player1
    end  
  end 

  def printQuestion
    puts "----- NEW TURN -----"
    @newQuestion = Question.new(@current_player.name)
    puts "#{@current_player.name}: #{@newQuestion.newQuestion}"
  end
 
  def checkAnswer
    input = gets.chomp.to_i

    if input == @newQuestion.right_answer
      puts "Yes! You are correct! "
      puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
    else
      puts "Seriously? Wrong answer."
      @current_player.life -= 1
      puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
    end
    
  end

  def checkWinner
    puts "-----GAME OVER -----"
    @diff_score = (@player1.life - @player2.life).abs
    puts "#{@current_player.name} wins with a score of #{@diff_score}"
    puts "Good Bye!"
  end

  def newTurn
    while @player1.life > 0 && @player2.life > 0
      printQuestion
      checkAnswer
      change_player
    end
    checkWinner
  end

end