class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # Checks for admin unless page is index or show
  before_action :is_admin!, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    category_filter
    draft_filter
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    if current_user && current_user.admin?

    else
      if @post.drafts == false
        redirect_to posts_path
      end
    end
    @post.views = @post.views+1
    @post.save
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
    @post.user = current_user
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
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category_filter
    if params.has_key?(:cat)
      @posts = Category.where(name: params[:cat]).first.posts.paginate(page: params[:page], per_page: 1)
    else
      @posts = Post.all.paginate(:page => params[:page], :per_page => 1)
    end
  end

  def draft_filter
    unless current_user && current_user.admin?
      @posts = @posts.where(drafts: true)
    else

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :drafts, :category_id)
    end
end
