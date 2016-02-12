# SEED INITIAL USERS/TEAM MEMBERS
# -----------------------------------------

users = %w(Sherry Boris Vicente Matte Jack Kevin Zoe Jay Eadon Franky Luis James)

users_added = 0

users.each do |user|
  username    = user.downcase

  unless User.find_by_username(username)
    User.create!(username: username, password: '123abc!!')
    users_added += 1
  end
end

puts "#{users_added} users added!"

# SEED WORK DAYS OUT TO ONE YEAR
# -----------------------------------------
