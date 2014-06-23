class ReviewsController < ApplicationController

	def create
		@review = Review.create(review_params)
		redirect_to product_path(params[:review][:product_id])
	end

private

	def review_params
		params.require(:review).permit(:product_id, :review, :user_id)
	end

end
