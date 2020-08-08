require_relative 'node'

class Lru
	attr_accessor :head, :tail, :current_size, :max_size

	def initialize(max_size)
		@head = nil
		@tail = nil
		@current_size = 0
		@max_size = max_size
		@lookup_table = {}
	end

	def get(key)
		result = @lookup_table[key]
		return -1 unless result
		return result.value if @tail == result # as result is tail itself; it is recently used item

		if result.prev_node == nil
			@head = result.next_node
			@head.prev_node = nil
		else
			result.prev_node.next_node = result.next_node
			result.next_node.prev_node = result.prev_node
		end

		@tail.next_node = result
		result.next_node = nil
		result.prev_node = @tail
		@tail = result
		result.value
	end

	def set(key, val)
		@current_size += 1
		if @current_size > @max_size # remove least recent item (i.e. head)
			@lookup_table.delete(@lookup_table.key(@head)) #remove from hash
			@head = @head.next_node # then change the head of DLL
			@head.prev_node = nil
		end
		new_node = Node.new(val, @tail, nil)
		if @tail == nil # when new node is first element in the queue
			@head = new_node
		else
			@tail.next_node = new_node
		end
		@tail = new_node
		@lookup_table[key] = new_node
	end
end
