positions = %w[teacher student manager_device priciple]
positions.each do |position|
  Position.find_or_create_by!(name: position)
end
