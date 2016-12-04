codes = (0..14).collect do |x|
  start = x + 7 + x / 5
  finish = start + 1
  { start: start, finish: finish, code: "lesson#{x}" }
end

codes.each { |x| Lesson.find_or_create_by!(x) }
