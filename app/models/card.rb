class Card < ActiveRecord::Base
	belongs_to :player

	validates :number, uniqueness: {scope: [:deck,:suite]}
	#format <Deck><suite><number>
	

	def self.deal_new(player)
		begin 	
			new_card = Card.new
			new_card.deck = deck_rand
			new_card.suite = suite_rand
			new_card.number = number_rand
			new_card.player = player
		end until new_card.save	
		new_card
	end

	def self.total(cards)
		total = 0
		cards.each do |card|
			total += card.points
		end
		total
	end

	def points
		return 11 if number.to_i == 1 
		return 10 if [11,12,13].include? number.to_i
		return number.to_i 
	end

	def self.deck_rand
		rand(1..6)
	end

	def self.suite_rand
		rand(1..4)
	end

	def self.number_rand
		rand(1..13)
	end
end