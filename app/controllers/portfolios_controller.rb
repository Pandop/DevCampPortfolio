class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all.order("created_at DESC")
    respond_to do |format|
      format.html       
      format.json { render(json: @portfolio_items) }
      format.js
    end    #render(layout: false)
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html {redirect_to(portfolios_path, notice: "Your post is now live.")}
        format.json { render(json: @portfolio_item) }
        format.js
      else
        format.html {render('new')}
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
    def portfolio_params 
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end

end
