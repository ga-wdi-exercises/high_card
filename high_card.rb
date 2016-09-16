def ranks
  ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
end

def suits
  [ "hearts", "spades", "clubs", "diamonds" ]
end

def deck
  ranks.product suits
end

def shuffle_deck
  deck.shuffle
end

def get_players
  players = []
  while (player = gets.chomp) != "play"
    players << {name: player, card: nil}
  end
  players
end

def play players
  shuffled_deck = shuffle_deck
  players.each do |player|
    player[:card] = shuffled_deck.pop
  end
  players
end

def get_winner players
  players.max_by{|player| ranks.index(player[:card][0])}
end
