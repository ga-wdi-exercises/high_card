require 'pry'
# Use these two arrays to generate a deck of cards.
RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
SUITS = [ "hearts", "spades", "clubs", "diamonds" ]

PLAYERS = []
BUFFER = "*" * 50

# create a random deck
def build_deck(ranks, suits)
  deck = []
  ranks.each_with_index do |rank, i|
    suits.each do |suit|
      card = {
        suit: suit,
        rank: rank,
        worth: i
      }
      deck << card
    end
  end
  deck.shuffle
end

# add players until game starts
def choose_players
  while true
    puts BUFFER
    puts "Want to play a game? #{PLAYERS.length} players so far. \n Please enter your name or press 'p' to play"
    name = gets.chomp.downcase
    break if name == 'p'
    player = {name: name, round_wins: 0}
    PLAYERS << player
  end
end

# deal out hands
def deal_cards(deck)
  hands = []
  PLAYERS.each do |player|
    hand = {
      player: player,
      card: deck.shift
    }
    hands << hand
  end
  hands
end

# Find a winner
def determine_winner(hands)
  winning_hand = hands.max_by do |hand|
    hand[:card][:worth]
  end
  # increment the player's rounds won by 1
  winning_hand[:player][:round_wins] += 1
  # return the winning hand hash
  winning_hand
end

# Put it all together
def play_game
  while true do
    deck = build_deck(RANKS, SUITS) # init deck
    choose_players # collect players
    puts BUFFER
    puts "High Card Commencing. Players in the game are:"
    PLAYERS.each do |player|
      puts player[:name]
    end
    # start game
    hands = deal_cards(deck) # each player gets a card
    puts BUFFER
    hands.each do |hand|
      puts "#{hand[:player][:name]} has the #{hand[:card][:rank]} of #{hand[:card][:suit]}"
    end
    puts BUFFER
    winner = determine_winner(hands)
    puts "#{winner[:player][:name]} won this round."
    puts BUFFER
    leaders = PLAYERS.sort_by{|p| p[:round_wins]}
    puts "#{leaders.last[:name]} is currently leading with #{leaders.last[:round_wins]} rounds won"
    puts BUFFER
    puts "Play again? \n Press 'q' to quit or 'p' to play again"
    choice = gets.chomp.downcase
    break unless choice == 'p'
  end
end

play_game

binding.pry
puts "fixes pry bug"
