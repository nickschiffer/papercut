json.extract! payment, :id, :payment_method, :address, :city, :state, :zip, :credit_card_number, :credit_card_cvc, :credit_card_exp, :paypal_email, :paypal_password, :zelle_email, :zelle_password, :created_at, :updated_at
json.url payment_url(payment, format: :json)
