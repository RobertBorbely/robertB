class TagsController < ApplicationController
	def index
	end

	def show
		@tag = Tag.friendly.find(params[:id])
	end

	private

		def tag_params
			params.require(:tag).permit(:title)
		end
end
