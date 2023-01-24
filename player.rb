class Player
  attr_accessor :life, :turn
  attr_reader :name

  def initialize(name)
    @name = name
    @life = 3
    @turn = false
  end

end