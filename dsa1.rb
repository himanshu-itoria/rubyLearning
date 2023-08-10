# Problem 1 :
# Write a program that starts as follows:
# n = 10
# instructions = "UDLRLR"
# Assume there is a rover on Mars on a virtual n-by-n grid. Given instructions U D L R the rover takes a step forward or a step backwards or stays on the spot and turns left and right respectively. The outcome of the program will print N, W, E, or S indicating which direction the rover is facing. The rover is initially facing north. Return -1 if Rover goes outside of the grid. Assume Rover is at first grid initially.


def move_rover(n, instructions)
    dir = ['N', 'E', 'S', 'W'] 
    curr_dir = 0 
    x, y = 0, 0 
  
    instructions.each_char do |instruction|
      case instruction
      when 'U'
        x -= 1 
      when 'D'
        x += 1
      when 'L'
        curr_dir = (curr_dir + 3) % 4 
      when 'R'
        curr_dir = (curr_dir + 1) % 4 
      else
        puts "Invalid instruction: #{instruction}"
        return
      end
  
     
      if x < 0 || x >= n || y < 0 || y >= n
        puts -1
        return
      end
    end
  
    puts dir[curr_dir]
  end
  
  
  n = gets
  instructions = gets
  move_rover(n, instructions)
  