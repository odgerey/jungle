class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  def show
    @products_total = Product.count(:all)
    @categories_total = Category.count(:all)
  end
end
