require './challenge'

RSpec.describe Street do
	describe "#getLandmarks" do
		it "returns an array of landmarks" do
			landmarks = [1,5,12,18,25]
			street = Street.new(landmarks)
			expect(street.getLandmarks).to eq(landmarks)
		end
	end
end

RSpec.describe Sensor do
	describe "#getError" do
		it "returns an error value" do
			error = 4
			sensor = Sensor.new(error)
			expect(sensor.getError).to eq(error)
		end
		it "returns a positive error value" do
			error = -4
			sensor = Sensor.new(error)
			expect(sensor.getError).to eq(error.abs)
		end
	end
end

RSpec.describe Vehicle do
	describe "#getStartPoint" do
		it "returns the start point" do
			startPoint = 2
			vehicle = Vehicle.new(startPoint, 7)
			expect(vehicle.getStartPoint).to eq(startPoint)
		end
	end
	describe "#getEndPoint" do
		it "returns the end point" do
			endPoint = 8
			vehicle = Vehicle.new(2, endPoint)
			expect(vehicle.getEndPoint).to eq(endPoint)
		end
	end
	before do	
		@error = 1
		@startPoint = 2
		@endPoint = 8
		@landmarks = [1,5,12,18,25]
		@street = Street.new(@landmarks)
		@vehicle = Vehicle.new(@startPoint, @endPoint)
		@sensor = Sensor.new(@error)
		@vehicle.traverse(@street, @sensor)
		@traversal = @vehicle.getTraversal()
	end
	describe "#getTraversal" do
		it "returns the traversal list" do
			expect(@traversal.length).to be > 0
		end
	end
	describe "#getTraversal" do
		it "the length of the traversal list should match the length difference between start and end points plus 1" do
			expect(@traversal.length).to eq(@endPoint - @startPoint + 1)
		end
	end
	describe "#getTraversal" do
		it "the traversal list must only contain 1s or 0s" do
			flag = 0
			for i in 0..@traversal.length-1
				if @traversal[i] !=0 && @traversal[i] != 1
					flag = 1
					break
				end
			end
			expect(flag).to eq(0)
		end
	end
end

error = 1
RSpec.describe getOutput(error) do
	describe "#getOutput(error)" do
		it "returns the traversal list" do
			traversal = getOutput(error)
			expect(traversal).to be_truthy
		end
	end
end