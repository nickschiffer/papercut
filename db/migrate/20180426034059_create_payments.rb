class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :credit_card_number
      t.integer :credit_card_cvc
      t.string :credit_card_exp
      t.string :paypal_email
      t.string :paypal_password
      t.string :zelle_email
      t.string :zelle_password

      t.timestamps
    end
  end
end
