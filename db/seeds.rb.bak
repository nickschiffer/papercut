#https://stackoverflow.com/a/37477624/9495112
User.create!([
  {email: "nick@schiffer.us", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-26 01:51:59", last_sign_in_at: "2018-04-26 01:51:59", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Nick", last_name: "Buyer"},
  {email: "nschiffer95@gmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-26 01:52:17", last_sign_in_at: "2018-04-26 01:52:17", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Nick", last_name: "Seller"}
])
Post.create!([
  {title: "Buyer Post", body: "", slug: nil, user_id: 1, image: nil, latitude: 37.337299080942294, longitude: -122.0115766464844}
])
#https://stackoverflow.com/a/12895838/9495112
Book.create!([
    {title: "Inelgible Book", author: "somone", condition: "Great", ISBN: "93912391", user_id: 1, value: 200.0, visibility: true, post_id: 1, image: open("https://images.pexels.com/photos/51342/books-education-school-literature-51342.jpeg?auto=compress&cs=tinysrgb&h=350")}
  ])
Receipt.create!([
  {buyer_id: "1", buyer_firstname: "Nick", buyer_lastname: "Buyer", buyer_email: "nick@schiffer.us", seller_id: "2", seller_firstname: "Nick", seller_lastname: "Seller", seller_email: "nschiffer95@gmail.com", book_title: "Seller Book", book_author: "someone", book_isbn: "2183183", trade_title: nil, trade_author: nil, trade_isbn: nil, payment_method: nil, amount: 50.0},
  {buyer_id: "1", buyer_firstname: "Nick", buyer_lastname: "Buyer", buyer_email: "nick@schiffer.us", seller_id: "2", seller_firstname: "Nick", seller_lastname: "Seller", seller_email: "nschiffer95@gmail.com", book_title: "Book for trade", book_author: "somenoe", book_isbn: "912391", trade_title: "Eligible Book 1", trade_author: "someone", trade_isbn: "12834832814", payment_method: nil, amount: 40.0}
])
Sale.create!([
  {buyer_id: 1, seller_id: 2, book_id: 2, trade_id: nil, state: 2, verified_by_buyer: false, verified_by_seller: false},
  {buyer_id: 1, seller_id: 2, book_id: 4, trade_id: 1, state: 2, verified_by_buyer: true, verified_by_seller: true}
])
