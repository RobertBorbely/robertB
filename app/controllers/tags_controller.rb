class TagsController < ApplicationController

	def show
		@tag = Tag.friendly.find(params[:id])
	end

	private

		def tag_params
			params.require(:tag).permit(:title)
		end
end
