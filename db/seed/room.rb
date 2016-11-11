blocks = %w[A B C D E]
rooms = (1..15).collect { |x| { no: x, capacity: Random.rand(30) + 30 } }
blocks.each do |block|
  rooms.each { |room| Room.find_or_create_by!(room.merge!(block: 'block')) }
end
