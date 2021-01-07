class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]
  
  def index
    @products = Product.order(id: :desc).all
  end

  def show
    @products = Product.all
    @product = Product.find params[:id]
    @count = Product.count

  end
end
