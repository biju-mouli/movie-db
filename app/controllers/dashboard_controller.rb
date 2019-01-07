class DashboardController < ApplicationController
  def index
  	@movies = Movie.all

    @categories = @movies.uniq.pluck(:category)
    @movies_by_category = Hash.new

    @categories.each do |category|
      @movies_by_category[category] = Movie.where(:category => category).length
    end   

    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context)} 
    end  
  end
end