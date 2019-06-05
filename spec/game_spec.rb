require_relative '../lib/game'

describe 'A game of rock paper scissors' do

  let(:game) do Game.new end

  let(:started_game) do 
    game = Game.new
    game.start
    game
  end

  it 'exists' do
    game
  end

  it 'can start' do
    started_game
  end

  it 'is not initially started' do
    expect(game).to_not be_started
  end

  it 'a started game knows that it has started' do
    expect(started_game).to be_started
  end

  describe 'playing' do

    context 'without starting' do
      it 'can not be played if it has not started' do
        expect { game.play }.to raise_error(RuntimeError)
      end
    end

    context 'after starting' do
      it 'can be played if it has started' do
        expect { started_game.play }.to_not raise_error
      end

      it 'returns nil when not provided with anything' do
        expect(started_game.play).to be_nil
      end

      it 'returns nil when only provided one rock, paper or scissor' do
        expect(started_game.play(:FAKE)).to be_nil
      end

      it 'does not return nil when two objects are provided' do
        expect(started_game.play(:FAKE, :FAKE)).to_not be_nil
      end
    end

    context 'rock vs scissors' do
      it 'announces the correct winner' do
        expect(started_game.play(:rock, :scissors)).to eq("Rock beats scissors!")
        expect(started_game.play(:scissors, :rock)).to eq("Rock beats scissors!")
      end
    end

    context 'rock vs paper' do
      it 'announces the correct winner' do
        expect(started_game.play(:paper, :rock)).to eq("Paper beats rock!")
        expect(started_game.play(:rock, :paper)).to eq("Paper beats rock!")
        expect(started_game.finished?).to be true
      end
    end

    context 'scissors vs paper' do
      it 'announces the correct winner' do
        expect(started_game.play(:scissors, :paper)).to eq("Scissors beats paper!")
        expect(started_game.play(:paper, :scissors)).to eq("Scissors beats paper!")
        expect(started_game.finished?).to be true
      end
    end

    context 'a tie started_game' do
      it 'announces a tie' do
        expect(started_game.play(:scissors, :scissors)).to eq("Tie game. Try again!")
        expect(started_game.play(:paper, :paper)).to eq("Tie game. Try again!")
        expect(started_game.play(:rock, :rock)).to eq("Tie game. Try again!")
        expect(started_game.finished?).to be false
      end
    end

  end

end
