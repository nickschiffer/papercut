class UsersController < ApplicationController
    before_action :set_user
        def overview

        end

        def inprogress_sells
            @sales = Sale.where(["seller_id = ? AND state = ?", @user.id, 0])

        end

        def inprogress_buys
            @sales = Sale.where(["buyer_id = ? AND state = ?", @user.id, 0])
        end

        def concluded_transactions
            @sales = Sale.where(["(buyer_id = ? OR seller_id = ?) AND state = ?", @user.id, @user.id, 1])
        end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
end
