class Sale < ApplicationRecord

    
    def cleanup
        puts "cleanup Called"
        @book = Book.find(self.book_id)
        books_from_post = Book.where(post_id: @book.post_id)
        if books_from_post.count <= 1
            post = Post.find(@book.post_id)
            post.destroy
        else
            @book.destroy
        end

        if (self.trade_id != nil)
            @trade = Book.find(self.trade_id)
            @trades_from_post = Book.where(post_id: @trade.post_id)
            if @trades_from_post.count <= 1
                post = Post.find(@trade.post_id)
                post.destroy
            else
                @trade.destroy
            end
        end

    end

    def generate_receipt
        puts "generating receipt"
        @receipt = Receipt.new
        @buyer = User.find(self.buyer_id)
        @seller = User.find(self.seller_id)
        @book = Book.find(self.book_id)
        @receipt = Receipt.create( buyer_id: (@buyer.id), buyer_firstname: (@buyer.first_name), buyer_lastname: (@buyer.last_name), buyer_email: (@buyer.email), seller_id: (@seller.id), seller_firstname: (@seller.first_name), seller_lastname: (@seller.last_name), seller_email: (@seller.email), book_title: (@book.title), book_author: (@book.author), book_isbn: (@book.ISBN), amount: (@book.value))
        @receipt.save!
        if self.trade_id != nil
            @trade = Book.find(self.trade_id)
            @amount = @book.value - @trade.value
            @receipt.update(trade_title: (@trade.title), trade_author: (@trade.author), trade_isbn: (@trade.ISBN), amount: (@amount))
        end
    end
end
