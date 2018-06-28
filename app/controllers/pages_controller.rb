class PagesController < ApplicationController
  def home
    @pages = Blog.all
    @skills = Skill.all
    @portfolios = Portfolio.all
  end

  def about
  end

  def contact
  end
end
