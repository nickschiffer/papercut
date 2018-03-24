class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @post = Post.find(@reply.post_id)
  end

  # GET /replies/new
  def new
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
    @reply = Reply.new
    @parent_id2 = params[:id]
    @post = Post.find(params[:post_id])
    # p "parent2 id = #{@parent_id2}"

  end

  # GET /replies/1/edit
  def edit
    @post = Post.find(@reply.post_id)
  end

  # POST /replies
  # POST /replies.json
  def create
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
    p "parent2 id create= #{@parent_id2}"
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    # @reply.post_id = @parent_id
    p "Create Post ID = #{@reply.post_id}"
    p "reply2 = #{@reply2}"
    respond_to do |format|
      if @reply.save
        format.html { redirect_to post_path(@reply.post_id), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Reply was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:body, :slug, :post_id)
    end

    @parent_id2 = 0


end

