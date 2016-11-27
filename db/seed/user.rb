pw = '111'
5.times do |id|
  User.create(email: "user#{id}@dut.vn", password: pw, password_confirmation: pw,
                         position: Position.all.sample)
end
