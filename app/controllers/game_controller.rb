class GameController < ApplicationController
	
	# cntinue playing the game
	def update
		player = Player.find_by(:name => params[:player_name].to_s)
		player.deal_card if params[:deal_type] == 'hit'
		choose_winner(params[:deal_type].present? && params[:deal_type] == 'stand' )
		render :index
	end

	# clears the old DB Records
	def new
		Card.destroy_all
		Player.destroy_all
	end

	# start a new game
	def create
		system = Player.create(:name => 'system')
		client = Player.create(:name => params[:player_name])
		system.deal_card
		client.deal_card
		client.deal_card
		choose_winner
		render :index and return
	end

	protected

	# calls rule engine with player object to decide on a winner
	def choose_winner(stand = false)
		client = Player.find_by(:name => 'client')
	 	system = Player.find_by(:name => 'system')
		@winner = RuleEngine.select_winner(client,system,stand)
	end


end