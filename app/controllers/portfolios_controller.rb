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

  private

  def params_portfolio
    params.require(:portfolio).permit(:name, :link, :description, :image).merge(user_id: current_user.id)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
