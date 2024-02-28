module RenderData
	def render_battleground
		while true
			puts 'Enter board size M(between 1 and 10):'
			board = gets.chomp.to_i
			if board < 1 || board > 10
				puts "Given board size not in range(1-10)\n\n"
				next
			end
			break
		end
		board
	end
	
	def render_ships
		while true
			puts 'Enter number of ships S(between 1 and 10):'
			n_ship = gets.chomp.to_i
			if n_ship < 1 || n_ship > 10
				puts "Given ship number not in range(1-10)\n\n"
				next
			end
			break
		end
		n_ship
	end
	
	def render_missiles
		while true
			puts 'Enter number of missiles T(between 1 and 100):'
			missile = gets.chomp.to_i
			if missile < 1 || missile > 100
				puts "Given missile number not in range(1-100)\n\n"
				next
			end
			break
		end
		missile
	end
	
	def render_ship_position(ships, player)
		while true
			puts "Enter Player#{player} Position(x,y pairs separated by colon):"
			position = gets.chomp.to_s
			if position.split(',').count != ships
				puts "Given position not equal to Ships(#{ships})\n\n"
				next
			end
			break
		end
		position
	end
	
	def render_missile_position(missiles, player)
		while true
			puts "Enter Player#{player} moves(x,y pairs of length T)):"
			moves = gets.chomp.to_s
			if moves.split(',').count != missiles
				puts "Given moves not equal to T(#{missiles})\n\n"
				next
			end
			break
		end
		moves
	end
	# Ex:- :default =>''
end
