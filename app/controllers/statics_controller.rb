class StaticsController < ApplicationController
	def home
		if user_signed_in?
			@user = current_user
			if @user.payment_verified == true
				redirect_to posts_path
			elsif (@user.payment_verified == false) && (@user.payment_method == "Cash")
				@user.update(payment_verified: true)
				redirect_to posts_path
			else
				redirect_to new_payment_path(:user_id => @user.id)
			end
		end


	end
end