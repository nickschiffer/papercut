User.create!([
  {email: "admin@papercut.com", password: "adminpassword", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-05-02 21:24:45", last_sign_in_at: "2018-04-26 01:51:59", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Admin", last_name: "Admin", payment_method: "Cash", payment_verified: true, isAdmin: true},
  {email: "nick@schiffer.us", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-05-02 21:25:18", last_sign_in_at: "2018-05-02 21:25:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Nickolas", last_name: "Schiffer", payment_method: "Credit", payment_verified: true, isAdmin: false},
  {email: "elon@spacex.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-05-02 21:33:21", last_sign_in_at: "2018-05-02 21:33:21", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Elon", last_name: "Musk", payment_method: "Cash", payment_verified: true, isAdmin: false},
  {email: "steve@hawking.com",password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-05-02 21:45:01", last_sign_in_at: "2018-05-02 21:45:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Stephen", last_name: "Hawking", payment_method: "Paypal", payment_verified: true, isAdmin: false}
])
Post.create!([
  {title: "Please Buy my Books", body: "", slug: nil, user_id: 2, image: nil, latitude: 37.32201128112275, longitude: -121.99784373632815},
  {title: "Finished all these books, new a new supply.", body: "", slug: nil, user_id: 3, image: nil, latitude: 37.33402338572039, longitude: -121.99097728125003},
  {title: "Read These Last Night.", body: "Need more", slug: nil, user_id: 4, image: nil, latitude: 36.17324621155663, longitude: -115.20142650000003}
])
Book.create!([
  {title: "Succeeding with Agile", author: "Mike Cohn", condition: "Great", ISBN: "9780321579362", user_id: 2, value: 37.66, visibility: true, post_id: 1, image: open("https://images-na.ssl-images-amazon.com/images/I/51vP21eyW3L._SX394_BO1,204,203,200_.jpg")},
  {title: "Embedded Systems", author: "Dr. Yifeng Zhu", condition: "Great", ISBN: "9780982692660", user_id: 2, value: 45.0, visibility: true, post_id: 1, image: open("http://web.eece.maine.edu/~zhu/book/zhu_book_front_cover_v3.png")},
  {title: "Principles of Environmental Science", author: "Mary Ann Cunningham", condition: "Great", ISBN: "9780078036071", user_id: 2, value: 45.0, visibility: true, post_id: 1, image: open("https://images-na.ssl-images-amazon.com/images/I/51bNKDTrb9L._SX413_BO1,204,203,200_.jpg")},
  {title: "Fundamentals of Astrodynamics", author: "Roger R. Bate", condition: "Great", ISBN: "9780486600611", user_id: 3, value: 16.89, visibility: true, post_id: 2, image: open("https://images-na.ssl-images-amazon.com/images/I/51bNHo1AKuL._SX314_BO1,204,203,200_.jpg")},
  {title: "Rocket Science", author: "Andrew Rader", condition: "Great", ISBN: "9780578198361", user_id: 3, value: 16.99, visibility: true, post_id: 2, image: open("https://images-na.ssl-images-amazon.com/images/I/51XkIq3zgLL._SX258_BO1,204,203,200_.jpg")},
  {title: "It's Only Rocket Science", author: "Lucy Rogers", condition: "Great", ISBN: "9780387753775", user_id: 3, value: 27.35, visibility: true, post_id: 2, image: open("https://images-na.ssl-images-amazon.com/images/I/51QwH6Vfw0L._SX326_BO1,204,203,200_.jpg")},
  {title: "Physics: Principles w/ Applications", author: "Douglas C. Giancoli", condition: "Great", ISBN: "9780136119715", user_id: 4, value: 13.23, visibility: true, post_id: 3, image: open("https://images-na.ssl-images-amazon.com/images/I/51WiduhKpSL._AC_UL320_SR252,320_.jpg")},
  {title: "Calculus", author: "James Stewart", condition: "Great", ISBN: "9780534393397", user_id: 4, value: 12.0, visibility: true, post_id: 3, image: open("https://images-na.ssl-images-amazon.com/images/I/51q49aU0R4L._SX380_BO1,204,203,200_.jpg")}
])
Payment.create!([
  {user_id: 2, payment_method: "Credit", address: "123 Something St.", city: "San Jose", state: "CA", zip: "95112", credit_card_number: "1023021301", credit_card_cvc: 123, credit_card_exp: "05/31/2018", paypal_email: nil, paypal_password: nil, zelle_email: nil, zelle_password: nil},
  {user_id: 4, payment_method: "Paypal", address: "123 Somewhere Rd.", city: "Boston", state: "MA", zip: "12345", credit_card_number: nil, credit_card_cvc: nil, credit_card_exp: nil, paypal_email: "steve@hawking.com", paypal_password: "123432144214", zelle_email: nil, zelle_password: nil}
])

