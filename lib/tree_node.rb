class PolyTreeNode
  
    attr_reader :value, :parent, :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def parent=(parent_val)
        unless parent_val.nil?
            if @parent != nil
                @parent.children.delete(self)
            end
            @parent = parent_val
            parent_val.children << self
        end
        if parent_val == nil
            @parent = nil
        end
    end

    def add_child(child)
        child.parent = self 
    end 
    
    def remove_child(child)
     raise "This is not a child" if child.parent == nil
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end

        return nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            queue.concat(node.children)
        end
        nil
    end
end