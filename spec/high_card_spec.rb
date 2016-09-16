def gets
  ["bob","mary", "tom", "play"].sample
end
require_relative ('../high_card')
require 'pry'


describe "highcard" do
  describe "deck" do
    it "is an array" do
      expect(deck.class).to eq(Array)
    end
    it "has 52 cards" do
      expect(deck.length).to eq(52)
    end
    it "cards are in the following format: [rank, suit]" do
      expect(deck.include?([2, "diamonds"])).to eq(true)
    end
    it "can be shuffled" do
      expect(deck).not_to eq(shuffle_deck)
    end
  end

  describe "players" do
    players = get_players
    it "is an array" do
      expect(players.class).to eq(Array)
    end
    it "players are a hash" do
      all_hash_players = players.select{|player| player.class == Hash}
      expect(players.length == all_hash_players.length)
    end
  end

  # breaks if play is sample first for players
  describe "game play" do
    players = play get_players
    p players
    it "should deal each player a card" do
      sample_card_rank = players.sample[:card][0]
      sample_card_suit = players.sample[:card][1]
      expect(ranks.include?(sample_card_rank)).to eq(true)
      expect(suits.include?(sample_card_suit)).to eq(true)
    end
    it "should determine a winner" do
      players = [
        {name: "sue", card: [2, "diamonds"]},
        {name: "mary", card: [4, "clubs"]}
      ]
      expect(get_winner players).to eq({name: "mary", card: [4, "clubs"]})
    end
  end
end
