levels = %w[A B C D F]
levels.each { |x| Rank.find_or_create_by!(level: x) }
