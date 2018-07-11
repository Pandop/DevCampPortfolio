class PortfoliosController < ApplicationController

  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  #before_action :find_portfolio_item, only: [:show, :edit, :update, :destroy]

  layout "portfolio"

  def index
    # @portfolio_items = Portfolio.all.order("created_at DESC")
    # @portfolio_items = Portfolio.angular.sorted
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items.sorted
    @portfolio_items = Portfolio.by_position 
    respond_to do |format|
      format.html       
      format.json { render(json: @portfolio_items) }
      format.js
    end    #render(layout: false)
  end

  def sort 
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render body: nil
  end

  def angular 
    @angular_portfolio_items = Portfolio.angular.sorted
  end

  def show 
    find_portfolio_item
  end

  def new
    @portfolio_item = Portfolio.new
    #3.times { @portfolio_item.technologies.build }
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

  def edit
    find_portfolio_item
  end

  def destroy
    find_portfolio_item 
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to(portfolios_path, notice: 'Record was removed.') }
      format.json { head :no_content }
      format.js
    end 
  end

  def update 
    find_portfolio_item
    respond_to do |format|
      if @portfolio_item.update_attributes(portfolio_params)
        format.html { redirect_to(portfolios_path, notice: 'Blog was successfully updated.') }

        format.json {render(:show, status: :ok, location: @portfolio_item)}
        format.js
      else
        format.html {render(:edit)}
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private

    def find_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
      return @portfolio_item
    end
    def portfolio_params 
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        :technologies_attributes => [:name])
    end

end
