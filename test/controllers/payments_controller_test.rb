require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { address: @payment.address, city: @payment.city, credit_card_cvc: @payment.credit_card_cvc, credit_card_exp: @payment.credit_card_exp, credit_card_number: @payment.credit_card_number, payment_method: @payment.payment_method, paypal_email: @payment.paypal_email, paypal_password: @payment.paypal_password, state: @payment.state, zelle_email: @payment.zelle_email, zelle_password: @payment.zelle_password, zip: @payment.zip } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { address: @payment.address, city: @payment.city, credit_card_cvc: @payment.credit_card_cvc, credit_card_exp: @payment.credit_card_exp, credit_card_number: @payment.credit_card_number, payment_method: @payment.payment_method, paypal_email: @payment.paypal_email, paypal_password: @payment.paypal_password, state: @payment.state, zelle_email: @payment.zelle_email, zelle_password: @payment.zelle_password, zip: @payment.zip } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end
