names = %w[laptop projector fan light table door air-condition]
names.each { |x| Category.find_or_create_by!(name: x) }
