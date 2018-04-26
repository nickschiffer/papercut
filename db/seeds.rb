#https://stackoverflow.com/a/37477624/9495112
#Create Admin account
User.create!([
  {email: "admin@papercut.com", password: "adminpassword", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-26 01:51:59", last_sign_in_at: "2018-04-26 01:51:59", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Admin", last_name: "Admin", isAdmin: true, payment_method: "Cash"}
])
