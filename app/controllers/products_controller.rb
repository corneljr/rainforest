class ProductsController < ApplicationController
	before action :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

	def index
		@products = Product.all
	end
end
