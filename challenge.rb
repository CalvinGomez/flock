class Street
	@@landmarks = Array.new(0)
	def initialize(landmarks)
		@@landmarks = landmarks
	end

	def getLandmarks()
		return @@landmarks
	end
end

class Sensor
	@@error = 0
	def initialize(error)
		@@error = error.abs
	end
	def getError()
		return @@error
	end
end

class Vehicle
	@@startPoint = 0
	@@endPoint = 0
	@@traversal = Array.new(0)
	def initialize(startPoint, endPoint)
		begin
			if startPoint > endPoint
				raise ArgumentError.new("Start Point is Greater than End Point")
			else
				@@startPoint = startPoint
				@@endPoint = endPoint
				@@traversal = Array.new(endPoint - startPoint + 1, 0)
			end
		end
	end

	def getTraversal()
		return @@traversal
	end

	def getStartPoint()
		return @@startPoint
	end

	def getEndPoint()
		return @@endPoint
	end

	def traverse(street, sensor)
		j = 0
		landmarks = street.getLandmarks()
		countLandmarks = landmarks.length
		error = sensor.getError()
		for	i in 0..@@traversal.length - 1
			if j == countLandmarks
				break
			else
				cur = landmarks[j]
				if (i+1) == cur
					@@traversal[i] = 1
					if (i - error) >= 0
						@@traversal[i-error] = 1
					end
					if (i + error) < @@traversal.length
						@@traversal[i+error] = 1	
					end
					j = j + 1
				else
					if @@traversal[i] != 1
						@@traversal[i] = 0
					end
				end
			end
		end
	end
end

def getInput()
	print("Enter sensor error value: ")
	error = gets.chomp.to_i
	puts("You have selected an error of " + error.to_s)
	return error
end

def getOutput(error)
	startPoint = 1
	endPoint = 30
	landmark = [1,5,12,18,25]
	street = Street.new(landmark)
	sensor = Sensor.new(error)
	vehicle = Vehicle.new(startPoint, endPoint)
	vehicle.traverse(street, sensor)
	traversal = vehicle.getTraversal()
	return traversal
end

def displayOutput(traversal)
	puts("\nOutput List")
	puts(traversal)
end

def runScript()
	error = getInput()
	traversal = getOutput(error)
	displayOutput(traversal)
end

if $0 == __FILE__
	runScript()
end