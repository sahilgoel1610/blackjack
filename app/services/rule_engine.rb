class RuleEngine
	# A simple rule engine which decides on the winner
	def self.select_winner(client,system,stand)
		return if client.nil? or system.nil?	
	 	return client if client.total == 21
	 	return system if client.total > 21 
	 	return client if system.total > 21
	 	
	 	if stand
	 		while system.total < 17
	 			system.deal_card
	 			system.reload
	 		end
	 		return client if system.total > 21
	 		return system if system.total == 21
	 		client.total > system.total ? client : system
	 	end 

	end
end