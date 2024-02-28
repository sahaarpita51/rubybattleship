require './lib/render_data.rb'

class Battleship
	include RenderData
	
	attr_accessor :size, :ships, :t_missiles, :p1_position, :p2_position, :p1_moves, :p2_moves, :p1_board, :p2_board
	def initialize
		@size = render_battleground
		@ships = render_ships
		@t_missiles = render_missiles
		@p1_position = render_ship_position(ships,1)
		@p2_position = render_ship_position(ships, 2)
		@p1_moves = render_missile_position(t_missiles, 1)
		@p2_moves = render_missile_position(t_missiles, 2)
	end
	
	def start_game
		@p1_board = point_ship_position(p1_position)
		@p2_board = point_ship_position(p2_position)
		
		@p2_board, @p1_result = evaluate_battle_result(p2_board, p1_moves)
		@p1_board, @p2_result = evaluate_battle_result(p1_board, p2_moves)
		print_result
	end
	
	private
	
	def point_ship_position(position)
		board = Array.new(size) { Array.new(size) { '-' } }
		position.split(',').each do |point|
			x, y = point.split(':').map(&:to_i)
			board[x][y] = 'B'
		end
		board
	end
	
	def evaluate_battle_result(board, moves)
		result = 0
		moves.split(',').each do |point|
			x, y = point.split(':').map(&:to_i)
			case board[x][y]
			when 'B'
				board[x][y] = 'X'
				result += 1
			when '-'
				board[x][y] = 'O'
			end
		end
		[board, result]
	end
	
	def print_result
		puts "Player1 board"
		print_board(p1_board)
		
		puts "Player2 board"
		print_board(p2_board)
		
		puts "P1: #{@p1_result}"
		puts "P2: #{@p2_result}"
		puts "Result: #{evaluate_winner}"
	end
	
	def print_board(board)
		board.each do |row|
			puts row.join(' ')
		end
	end
	
	def evaluate_winner
		if @p1_result > @p2_result
			'Player1 wins'
		elsif @p1_result < @p2_result
			'Player2 wins'
		else
			'Draw'
		end
	end
end

# b = Battleship.new
# b.start_game