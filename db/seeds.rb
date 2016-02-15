starting_order = ['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Sherry',  'Matte', 'Kevin', 'Kevin', 'Vicente', 'Zoe', 'Kevin',  'Matte', 'Zoe', 'Jay', 'Boris', 'Eadon', 'Sherry', 'Franky', 'Sherry', 'Matte', 'Franky', 'Franky', 'Kevin', 'Boris', 'Franky', 'Vicente', 'Luis', 'Eadon', 'Boris', 'Kevin', 'Matte', 'Jay', 'James', 'Kevin', 'Sherry', 'Sherry', 'Jack', 'Sherry', 'Jack']


# SEED INITIAL USERS/TEAM MEMBERS
# -----------------------------------------
users       = starting_order.uniq
users_added = 0

users.each do |user|
  username    = user.downcase

  unless User.find_by_username(username)
    User.create!(username: username, password: '123abc!!')
    users_added += 1
  end
end

puts "#{users_added} users added!"

# SEED WORK-DAYS OUT TO ONE YEAR
# -----------------------------------------
start_date = Time.zone.today
end_date   = start_date + 1.year

# Add work days and user association
(start_date..end_date).each do |date|
  if WorkDay.valid?(date)
    username = starting_order.shift
    user     = username ? User.find_by_username(username.downcase).id : nil
    WorkDay.create(date: date, user_id: user)
  end
end
