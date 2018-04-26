class RegistrationsController < Devise::RegistrationsController
	
	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :payment_method)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :payment_verified)
	end

end	