class PortfoliosController < ApplicationController
  before_action :login, except: :index

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params_portfolio)
    if @portfolio.valid?
      @portfolio.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    if user_signed_in? && current_user.id == portfolio.user_id
      portfolio.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  def favorite
    likes = Like.find_by(user_id: current_user.id)
    if likes.present?
    @portfolios = Portfolio.all.where(id: likes.portfolio_id)
    end
  end

  private

  def params_portfolio
    params.require(:portfolio).permit(:name, :link, :description, :image).merge(user_id: current_user.id)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
