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

        @parent
    end
end