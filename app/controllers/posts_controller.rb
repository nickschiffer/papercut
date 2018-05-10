class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy], unless: -> {params[:id] == "books"}

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @images = []
    @posts.each do |post|
      #@books_tmp = Book.where(post_id: post.id)
      @books_tmp = Book.where(["post_id = ? AND visibility = 't'", post.id])
      if @books_tmp.empty?
        post.image = ActionController::Base.helpers.asset_url("book_placeholder_thumb.png", type: :image)
      else
        @books_tmp.each do |book|
          if book.image_url(:thumb).to_s != ActionController::Base.helpers.asset_url("book_placeholder_thumb.png", type: :image)
            post.image = book.image_url(:thumb).to_s
            break
          else
            post.image = ActionController::Base.helpers.asset_url("book_placeholder_thumb.png", type: :image)
          end
        end
      end
    end
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @replies = Reply.where(post_id: @post.id)
    #@books   = Book.where(post_id: @post.id)
    @books    = Book.where(["post_id = ? AND visibility = 't'", @post.id])
    @user    = User.find(@post.user_id)
  end

  def books
    search = params[:term].present? ? params[:term] : nil
    @allbooks = if search
      Book.where(["(title LIKE ? OR author LIKE ? OR \"ISBN\" LIKE ? ) AND visibility = 't'", "%#{search}%", "%#{search}%", search])
      # Book.where(["(title ILIKE ? OR author ILIKE ? OR \"ISBN\" LIKE ? ) AND visibility = 't'", "%#{search}%", "%#{search}%", search])
      # PG Version ^
    else
      @allbooks = Book.where("visibility = 't'")
    end
  end

  def searchbooks

  end

  def autocomplete
    render json: Book.search(params[:query], {
      fields: ["title^5", "author", "ISBN"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :latitude, :longitude)
    end
end
