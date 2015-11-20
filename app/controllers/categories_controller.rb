class CategoriesController < ApplicationController
	before_action :find_by_id, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
		@posts = @category.posts.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(categories_params)

	    if @category.save
	      redirect_to @category ,notice: 'Sikeresen létrehoztad a kategóriát :)'
	    else
	      render :new
	    end
	end

	def edit
	end

	def update
		if @category.update(categories_params)
			redirect_to @category, notice: "Gratulálok sikeresen frissítettél egy kategóriát!"
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
	end

	private

		def find_by_id
			@category = Category.friendly.find(params[:id])
		end

		def categories_params
			params.require(:category).permit(:title)
		end
end
