RSpec.describe RenderData do
	let(:dummy_class) { Class.new { extend RenderData } }
	before do
		allow_any_instance_of(Object).to receive(:puts).and_return('')
	end

	describe '#render_battleground' do
		before do
			allow_any_instance_of(Object).to receive(:gets).and_return("5\n")
		end
		it 'returns the size of the board' do
			expect(dummy_class.render_battleground).to eq(5)
		end

		context 'when board size is not in range' do
			before do
				allow_any_instance_of(Object).to receive(:gets).and_return("11\n", "5\n")
			end
			it 'asks for the size again' do
				expect(dummy_class.render_battleground).to eq(5)
			end
		end
	end

	describe '#render_ships' do
		before do
			allow_any_instance_of(Object).to receive(:gets).and_return("5\n")
		end
		it 'returns the number of the ships' do
			expect(dummy_class.render_ships).to eq(5)
		end

		context 'when ship number is not in range' do
			before do
				allow_any_instance_of(Object).to receive(:gets).and_return("11\n", "5\n")
			end
			it 'asks for the size again' do
				expect(dummy_class.render_ships).to eq(5)
			end
		end
	end

	describe '#render_missiles' do
		before do
			allow_any_instance_of(Object).to receive(:gets).and_return("6\n")
		end
		it 'returns the number of the missiles' do
			expect(dummy_class.render_missiles).to eq(6)
		end

		context 'when missile number is not in range' do
			before do
				allow_any_instance_of(Object).to receive(:gets).and_return("110\n", "Ten\n", "6\n")
			end
			it 'asks for the size again' do
				expect(dummy_class.render_missiles).to eq(6)
			end
		end
	end

	describe '#render_ship_position' do 
		before do
			allow_any_instance_of(Object).to receive(:gets).and_return("1:1,2:2,3:3,4:4,4:3\n")
		end
		it 'returns the position of the ships' do
			expect(dummy_class.render_ship_position(5, 1)).to eq("1:1,2:2,3:3,4:4,4:3")
		end

		context 'when position is not equal to ships' do
			before do
				allow_any_instance_of(Object).to receive(:gets).and_return("1:1,2:2,3:3,4:4,4:3,5:5\n", "1:1,2:2,3:3,4:4,4:3\n")
			end
			it 'asks for the position again' do
				expect(dummy_class.render_ship_position(5, 1)).to eq("1:1,2:2,3:3,4:4,4:3")
			end
		end
	end

	describe '#render_missile_position' do
		before do
			allow_any_instance_of(Object).to receive(:gets).and_return("1:1,2:2,3:3,4:4,4:3\n")
		end
		it 'returns the position of the missiles' do
			expect(dummy_class.render_missile_position(5, 1)).to eq("1:1,2:2,3:3,4:4,4:3")
		end

		context 'when position is not equal to missiles' do
			before do
				allow_any_instance_of(Object).to receive(:gets).and_return("1:1,2:2,3:3,4:4,4:3,5:5\n", "1:1,2:2,3:3,4:4,4:3\n")
			end
			it 'asks for the position again' do
				expect(dummy_class.render_missile_position(5, 1)).to eq("1:1,2:2,3:3,4:4,4:3")
			end
		end
	end
end