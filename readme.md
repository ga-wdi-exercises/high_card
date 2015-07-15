## Let's Play High-Card-Wins

Game time! Create a new file called `high_card.rb` for this exercise.

**Methods to research:**

* `each_with_index`
* `max`
* `shuffle`

**Tasks:**

1. Build a deck of shuffled cards.
	* The deck should be an array of cards.
	* Each card should be a mini-array with a value and suit. Example: `[8, "hearts"]`
	* Shuffle the deck. It would look something like this...

	```ruby
	deck = [
		[8, "hearts"],
		[2, "diamonds"],
		["J", "clubs"],
		...
	]
	```

2. Collect an array of player names by prompting:
	* **"{n} players so far. Enter a player name, or type 'play':"**
3. Upon *"play"*, deal each player a card.
4. Find the highest card score dealt (Aces high).
5. Find the winning player name, then print out:
	* **"Winner(s): {name1, name2, …}!"**

### Bonus I

Print out *one* of the following outcomes:

* **"The winner is {name}!"**
* **"It's a tie between {name1, name2, …}!"**

### Bonus II

Have the game redraw cards for both players in the case of a tie.
