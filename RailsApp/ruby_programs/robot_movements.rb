class RobotMovement
	def count_paths table, x, y, w, h
		if table[x][y] == true 
			return 0									
		elsif ((x == w - 1) and (y == h - 1)) == true	
			return 1										
		else	
			count = 0
			table[x][y] = true 									
			count += count_paths table, x - 1, y, w, h if x > 0
			count += count_paths table, x + 1, y, w, h if x < w - 1
			count += count_paths table, x, y - 1, w, h if y > 0
			count += count_paths table, x, y + 1, w, h if y < h - 1
			table[x][y] = false
			return count
		end
	end
end
width = 4 
height = 4
table = (1..width).map { Array.new height, false }
robot_movement_object= RobotMovement.new
puts robot_movement_object.count_paths table, 0, 0, width, height

			
