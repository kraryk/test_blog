class PostsController < ApplicationController
 
 # before_action :require_user, only: [:new, :edit, :update, :destroy]
 # before_action :require_editor, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      tag_params.split(",").each do |tag_new|
        allready_exist = false
        Tag.find_each do |tag_db|
          if (tag_db[:name] == tag_new)
            allready_exist = true
            @post.tags << tag_db
            break
          end 
        end
        @post.tags.create(:name => tag_new) if !allready_exist
      end
      redirect_to posts_url, notice: 'Post was successfully updated.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      # brak update'u dla tagów
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :picture)
  end

  def tag_params
    params[:post_tags]
  end
end
