pw = '111'
2.times do |id|
  User.create(email: "user#{id}@dut.vn", password: pw, password_confirmation: pw, role: "admin")
end
