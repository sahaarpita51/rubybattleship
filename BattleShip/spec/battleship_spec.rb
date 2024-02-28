require 'battleship'
RSpec.describe Battleship do
	let(:battleship) {Battleship.new}
	before do
		allow_any_instance_of(Object).to receive(:puts).and_return('')
		allow_any_instance_of(Object).to receive(:gets).and_return("5\n", "5\n", "5\n", "1:1,2:2,3:3,4:4,4:3\n", "1:1,2:2,3:3,4:4,4:3\n", "1:1,2:2,3:3,4:4,4:3\n", "1:1,2:2,3:3,4:4,4:3\n")
	end
	describe "#initialize" do
		it "creates a new instance of Battleship" do
			expect(battleship).to be_an_instance_of Battleship
		end
		
		it "creates a new instance of number of field size" do
			expect(battleship.instance_variable_get(:@size)).to eq(5)
		end
		
		it "creates a new instance of number of ships" do
			expect(battleship.instance_variable_get(:@ships)).to eq(5)
		end
		
		it "creates a new instance of number of missiles" do
			expect(battleship.instance_variable_get(:@t_missiles)).to eq(5)
		end
		
		it "creates new instances of 2 player ship position" do
			expect([battleship.instance_variable_get(:@p1_position),battleship.instance_variable_get(:@p2_position)]).to eq(%w[1:1,2:2,3:3,4:4,4:3 1:1,2:2,3:3,4:4,4:3])
		end
		
		it "creates new instances of 2 player moves" do
			expect([battleship.instance_variable_get(:@p1_moves),battleship.instance_variable_get(:@p2_moves)]).to eq(%w[1:1,2:2,3:3,4:4,4:3 1:1,2:2,3:3,4:4,4:3])
		end
	end
	
	describe "#start_game" do
		before do
			battleship.instance_variable_set(:@size, 5)
			battleship.instance_variable_set(:@ships, 5)
			battleship.instance_variable_set(:@t_missiles, 5)
			battleship.instance_variable_set(:@p1_position, "1:1,2:2,3:3,4:4,4:3")
			battleship.instance_variable_set(:@p2_position, "1:1,2:2,3:3,4:4,4:3")
		end
		
		context "when ship position and moves same" do
			it 'returns draw result' do
				battleship.instance_variable_set(:@p1_moves, "1:1,2:2,3:3,4:4,4:3")
				battleship.instance_variable_set(:@p2_moves, "1:1,2:2,3:3,4:4,4:3")
				battleship.start_game
				expect(battleship.instance_variable_get(:@p1_result)).to eq(5)
				expect(battleship.instance_variable_get(:@p2_result)).to eq(5)
				expect(battleship.send(:evaluate_winner)).to eq('Draw')
			end
		end

		context "when player1 has 3 correct moves and player2 has 2" do
			it 'returns player 1 win' do
				battleship.instance_variable_set(:@p1_moves, "1:1,2:2,3:3,3:4,2:3")
				battleship.instance_variable_set(:@p2_moves, "0:1,0:2,0:3,4:4,4:3")
				battleship.start_game
				expect(battleship.instance_variable_get(:@p1_result)).to eq(3)
				expect(battleship.instance_variable_get(:@p2_result)).to eq(2)
				expect(battleship.send(:evaluate_winner)).to eq('Player1 wins')
			end
		end

		context "when player1 has 2 correct moves and player2 has 4" do
			it 'returns player 1 win' do
				battleship.instance_variable_set(:@p1_moves, "1:1,2:2,3:3,3:4,2:3")
				battleship.instance_variable_set(:@p2_moves, "1:1,2:2,0:3,4:4,4:3")
				battleship.start_game
				expect(battleship.instance_variable_get(:@p1_result)).to eq(3)
				expect(battleship.instance_variable_get(:@p2_result)).to eq(4)
				expect(battleship.send(:evaluate_winner)).to eq('Player2 wins')
			end
		end
	end
end