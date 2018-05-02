class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @book = Book.find(@sale.book_id)
    @buyer = User.find(@sale.buyer_id)
    @seller = User.find(@sale.seller_id)
    if @sale.trade_id != nil
      @trade = Book.find(@sale.trade_id)
      @body_text = "#{@buyer.first_name} wants to trade with you"
    end
    @state = case @sale.state
    when 0
      "Waiting on Your Input"
    when 1
      "Finished"
    else
      "Something's Not Right"
    end

  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  def advance_state
    sale = Sale.find(params[:id])
    if sale.state == 0
      sale.update(state: (1))
      redirect_to root_path
    elsif sale.state == 1
      if current_user.id == sale.buyer_id
        if (sale.trade_id != nil) && (sale.verified_by_buyer == false)
          sale.update(verified_by_buyer: (true))
        end
        if (sale.trade_id != nil) && (sale.verified_by_seller == true)
          sale.update(verified_by_buyer: (true))
          sale.update(state: (2))
          sale.generate_receipt()
          sale.cleanup()
          redirect_to root_path
          return
        end
        if (sale.trade_id == nil)
          sale.update(state: (2))
          sale.generate_receipt()
          sale.cleanup()
          redirect_to root_path
          return
        end
        redirect_to root_path
      end
      if current_user.id == sale.seller_id
        if (sale.trade_id != nil) && (sale.verified_by_seller == false)
          sale.update(verified_by_seller: (true))
        end
        if (sale.trade_id != nil) && (sale.verified_by_buyer == true)
          sale.update(verified_by_seller: (true))
          sale.update(state: (2))
          sale.generate_receipt()
          sale.cleanup()
          redirect_to root_path
          return
        end
        if (sale.trade_id == nil)
          sale.update(state: (2))
          sale.generate_receipt()
          sale.cleanup()
          redirect_to root_path
          return
        end
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    
    

    respond_to do |format|
      if @sale.save
        book = Book.find(@sale.book_id)
        if @sale.trade_id != nil
          trade = Book.find(@sale.trade_id)
          trade.make_invisible
        end
        book.make_invisible
        # @book.toggle(:visibility)
        # @trade.toggle(:visibility)
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    book = Book.find(@sale.book_id)
        if @sale.trade_id != nil
          trade = Book.find(@sale.trade_id)
          trade.make_visible
        end
    book.make_visible
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Sale was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:buyer_id, :seller_id, :book_id, :trade_id)
    end

    

end
