class Question
  attr_reader :newQuestion, :answer

  def initialize(name)
    @player = name
    number1 = rand(1..20)
    number2 = rand(1..20)
    @newQuestion = "What does #{number1} plus #{number2} equal?"
    @answer = number1 + number2
  end

  def right_answer
    @answer
  end
  
end