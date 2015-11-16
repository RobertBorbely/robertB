class PostsController < ApplicationController
  before_action :findby_id, only: [:show, :edit,:update, :destroy]

  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post ,notice: 'Sikeresen létrehoztad a postot :)'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Sikeresen módosítottad a postot! :)'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  private

    def findby_id
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end
end
