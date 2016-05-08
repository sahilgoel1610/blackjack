class Player < ActiveRecord::Base
	has_many :cards
	

	def deal_card
		Card.deal_new(self)
		update_total
	end

	def update_total
		self.total = Card.total(cards)
		self.save
	end

end