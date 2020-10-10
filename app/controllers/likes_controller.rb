class LikesController < ApplicationController
  before_action :set_valiables

  def like
    like = current_user.likes.new(portfolio_id: @portfolio.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(portfolio_id: @portfolio.id)
    like.destroy
  end

  private

  def set_valiables
    @portfolio = Portfolio.find(params[:portfolio_id])
    @id_name = "#like-link-#{@portfolio.id}"
  end
end
