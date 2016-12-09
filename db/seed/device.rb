brands = %w[Dell Acer HP Tosiba Apple]
category_ids = Category.select(:id)
rooms = Room.select(:id)
status = %w[Normal Damage]
category_ids.each do |category_id|
  (1..5).each do |id|
    Device.find_or_create_by(name: Faker::Company.name, import_date: Faker::Date.forward(30),
                             brand: brands.sample, room_id: rooms.sample, category_id: category_id.id,
                             date_producer: (1..3).to_a.sample.years.ago, status: status.sample)
  end
end
