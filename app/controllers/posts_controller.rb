class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :findby_id, only: [:show, :edit,:update, :destroy]

  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
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

    redirect_to posts_path
  end

  private

    def findby_id
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :slug, :category_id, :tag_list)
    end
end
