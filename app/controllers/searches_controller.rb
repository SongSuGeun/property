class SearchesController < ApplicationController
  def index
  end
  
  def result
    @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("name like ?", "%#{params[:search_text]}%")
  end
  
  def many_result
    @result = Property.ransack(params[:q])
    p @result
    @searches = @result.result
    p @searches
   #@searches = eval(params[:bulletin]).where("name like ?", "%#{params[:search_text]}%")
  end

end
