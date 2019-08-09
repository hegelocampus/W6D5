require 'tdd.rb'

describe "#my_uniq" do
  it "removes duplicates" do
    #subject(:array) { Array.new }
    array = [1, 1, 3, 8, 9, 9, 2]
    expect(array.my_uniq).to eq(array.uniq)
  end
  it "returns a new array" do
    array = [1, 1, 3, 8, 9, 9, 2]
    expect(array.my_uniq.object_id).to_not eq(array.object_id)
  end
end


# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]


describe "#two_sum" do
    it "returns an array of positions" do
        array = [-1, 0, 2, -2, 1]
        solved = array.two_sum
        solved.each do |sub|
            expect(sub.length).to eq(2)
        end
    end 
    it "elements at positions sum to 0" do
        array = [-1, 0, 2, -2, 1]
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe "#my_transpose" do
    let(:arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    let(:sol) { [[0, 3, 6],[1, 4, 7],[2, 5, 8]] }
    it "converts between the row-oriented and column-oriented representations" do
        expect(arr.my_transpose).to eq(sol)
    end
end

describe "#stock_picker" do
    let(:stocks1) {[45, 32, 78, 25, 12, 56, 34, 22, 109]}
    let(:stocks2) {[109, 32, 78, 25, 12, 56, 45, 34, 22]}
    let(:stocks3) {[109, 10, 78, 100, 12, 56, 45, 34, 100]}

    it "outputs the most profitable pair of days" do
      expect(stock_picker(stocks1)).to eq([4, 8])
    end
    it "the stock must be bought before it is sold" do
      expect(stock_picker(stocks2)).to eq([1, 2])
    end
    it "the stocks have the shortest transaction time" do
      expect(stock_picker(stocks3)).to eq([1, 3])
    end
end

describe TowersofHanoi do
    subject(:towers) {TowersofHanoi.new}
    it "initializes with the corect board" do 
        expect(towers.left).to eq([1, 2, 3])
        expect(towers.middle).to eq([])
        expect(towers.right).to eq([])
    end
    describe "::move" do
        let(:start_peg) {towers.left}
        let(:end_peg) {towers.right}
        it "accepts origin and destination pegs" do 
            expect { TowersofHanoi.move(start_peg, end_peg) }.to_not raise_error(InvalidInputsError)
        end
        it "moves one ring to a new tower" do
            flowers = TowersofHanoi.new
            TowersofHanoi.move(flowers.left, flowers.right)
            expect(flowers.left).to eq([2, 3])
            expect(flowers.middle).to be_empty
            expect(flowers.right).to eq([1])
        end
        context "when there are invalid inputs" do 
            showers = TowersofHanoi.new
            showers.left = []
            showers.middle = [3]
            showers.right = [1, 2]
            
            it "raises error when start peg has no discs" do
                expect {TowersofHanoi.move(showers.left, showers.middle)}.to raise_error(InvalidInputsError)
            end
            it "raises error when disc1 is larger than disc 2" do
                expect {TowersofHanoi.move(showers.middle, showers.right)}.to raise_error(InvalidInputsError)
            end

        end
    end

    describe "#won?" do
      context "when the right tower is [1, 2, 3]"
      
    end
end