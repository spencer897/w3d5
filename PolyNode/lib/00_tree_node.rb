require "byebug"

module Searchable
    def dfs(target_value)
        return self if self.value == target_value 
        @children.each do |child|
            output = child.dfs(target_value)  
            return output if output !=nil && output.value == target_value
        end  
        nil
    end 
    def bfs(target_value) 
        arr = [self]
        while arr.length > 0 
             node = arr.shift 
                if node.value == target_value 
                     return node
                else
                    arr += node.children.dup
                end 
        end 
        nil 
    end 
end 


class PolyTreeNode
    include Searchable 
    def initialize(value)
        @value = value
        @parent = nil
        @children = [] 
    end 
    def parent 
        @parent
    end 
    def children
        @children
    end 
    def value 
        @value 
    end 
    def parent=(node)
       @parent.children.delete(self) if @parent != nil 
       @parent = node
       node.children.push(self) if node != nil
    end 
    def add_child(child_node)
        child_node.parent = self
    end 
    def remove_child(child_node)
        raise "NOT CHILD NODE" if !self.children.include?(child_node)
        child_node.parent = nil
    end 
end
