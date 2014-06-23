class ProductsController < ApplicationController
	before_action :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product)
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
		@review = Review.new
		@reviews = Review.where(product_id: @product.id)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to root_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		Product.update(product_params)
		redirect_to product(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name,:description,:price, :user_id)
	end
end
