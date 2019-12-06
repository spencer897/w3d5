require "00_tree_node.rb"

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @starting_position = pos 
        @considered_positions = [@starting_position]
    end 
    def self.valid_moves(pos)
        col = pos[0]
        row = pos[1]
        arr_1 = [1,-1].product([2,-2])
        arr_2 = [2,-2].product([1,-1])
        arr_3 = arr_1.concat(arr_2)
        arr_3.map! do |subarr|
            subarr = [subarr[0] + col, subarr[1] + row]
        end 
        arr_3.select! do |subarr|
            subarr[0] < 8 || subarr[0] > -1 || subarr[1] < 8 || subarr[1] > -1  
        end 
        return arr_3 
    end 
    def new_move_positions(pos)
        KnightPathFider.valid_moves.each do |position|
            @considered_positions << position if @considered_positions.include?(position)
        end 
    end 
    def build_move_tree(new_pos)
        arr = [pos]
        while arr.length > 0 
             node = arr.shift 
                arr += node.children.dup
        end 
        nil 
    end 



end 
