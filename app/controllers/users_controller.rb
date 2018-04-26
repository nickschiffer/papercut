class UsersController < ApplicationController
    before_action :set_user
    before_action :users_exist, only: [:inprogress_buys, :inprogress_sells]
    #before_action :books_exist, only: [:inprogress_buys, :inprogress_sells]
        def overview

        end

        def inprogress_sells
            @sales = Sale.where(["seller_id = ? AND state < ?", @user.id, 2])

        end

        def inprogress_buys
            @sales = Sale.where(["buyer_id = ? AND state < ?", @user.id, 2])
        end

        def concluded_transactions
            @receipts = Receipt.where(["(buyer_id = ? OR seller_id = ?)", @user.id, @user.id])
        end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def cleanup_sales_in_progress
        @sales = Sale.where(["buyer_id = ? OR seller_id = ?", @user.id,@user.id])
        if @sales.exists?
            @sales.destroy_all
            flash[:success] = 'Deleted all Sales in Progress'
        end

    end

    def users_exist
        @sales = Sale.where(["buyer_id = ? OR seller_id = ?", @user.id,@user.id])
        @sales.each do |sale|

            if !(User.exists?(sale.buyer_id))
                if !(Book.exists?(sale.book_id))
                    if sale.trade_id != nil
                        if (Book.exists?(sale.trade_id))
                            @trade = Book.find(sale.trade_id)
                            @trade.make_visible
                        end
                    end
                    flash[:danger] = 'Book No Longer Exists.'
                end
                if sale.trade_id != nil
                    if !(Book.exists?(sale.trade_id))
                        if (Book.exists?(sale.book_id))
                            @book = Book.find(sale.book_id)
                            @book.make_visible
                        end
                    flash[:danger] = 'Trade No Longer Exists.'
                    end
                end
                sale.destroy
                flash[:danger] = 'Buyer No Longer Exists.'
                redirect_to root_path
                return
            elsif !(User.exists?(sale.seller_id))
                if !(Book.exists?(sale.book_id))
                    if sale.trade_id != nil
                        if (Book.exists?(sale.trade_id))
                            @trade = Book.find(sale.trade_id)
                            @trade.make_visible
                        end
                    end
                    flash[:danger] = 'Book No Longer Exists.'
                end
                if sale.trade_id != nil
                    if !(Book.exists?(sale.trade_id))
                        if (Book.exists?(sale.book_id))
                            @book = Book.find(sale.book_id)
                            @book.make_visible
                        end
                    flash[:danger] = 'Trade No Longer Exists.'
                    end
                end
                sale.destroy
                flash[:danger] = 'Seller No Longer Exists.'
                redirect_to root_path
                return
            end
        end
      end
      
      def books_exist
        @sales = Sale.where(["buyer_id = ? OR seller_id = ?", @user.id,@user.id])
        @sales.each do |sale|
            if !(Book.exists?(sale.book_id))
                if sale.trade_id != nil
                    if (Book.exists?(sale.trade_id))
                        @trade = Book.find(sale.trade_id)
                        @trade.make_visible
                    end
                end
                sale.destroy
                flash[:danger] = 'Book No Longer Exists.'
            end
            if sale.trade_id != nil
                if !(Book.exists?(sale.trade_id))
                    if (Book.exists?(sale.book_id))
                        @book = Book.find(sale.book_id)
                        @book.make_visible
                    end
                sale.destroy
                flash[:danger] = 'Trade No Longer Exists.'
                end
            end
        end
      end
end
