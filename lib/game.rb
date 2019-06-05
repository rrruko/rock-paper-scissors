class Game

  attr_reader :started
  attr_reader :finished

  def start
    @started = true
    @finished = false
  end

  def started?
    self.started || false
  end

  def matchups
    {
      :rock => :scissors,
      :paper => :rock,
      :scissors => :paper
    }
  end

  def beats(left, right)
    matchups[left] == right
  end

  def win_message(winner, loser)
    "#{winner.capitalize} beats #{loser}!"
  end

  def tie_message
    "Tie game. Try again!"
  end

  def tie(left, right)
    left == right
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?
    return nil unless (left && right)

    if beats(left, right)
      @finished = true
      win_message(left, right)
    elsif beats(right, left)
      @finished = true
      win_message(right, left)
    elsif tie(left, right)
      tie_message
    else
      :UNKNOWN
    end
  end

  def finished?
    self.finished || false
  end

end
