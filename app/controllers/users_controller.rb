class UsersController < ApplicationController
    before_action :set_user
        def overview

        end

        def inprogress_sells
            @sales = Sale.where(seller_id: @user.id)

        end

        def inprogress_buys
            @sales = Sale.where(buyer_id: @user.id)
        end

        def concluded_transactions
            @sales = Sale.where(["buyer_id = ? OR seller_id = ?) AND state = 1", @user.id, @user.id])
        end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
end
