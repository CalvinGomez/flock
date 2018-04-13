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