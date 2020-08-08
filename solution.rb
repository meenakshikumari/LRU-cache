require_relative 'lru_cache'

lru = Lru.new(4)
lru.set(1,'one')

lru.set(2,'two')
lru.set(3,'three')
p "head val: #{lru.head.value}"
p "tail val: #{lru.tail.value}"
p lru.get(2)
p lru.get(1)

p "head val: #{lru.head.value}"
p "tail val: #{lru.tail.value}"


lru.set(4, 'four')
lru.set(5, 'five')
lru.set(6, 'six')
p lru.get(2)
p lru.get(4)
p "head val: #{lru.head.value}"
p "tail val: #{lru.tail.value}"