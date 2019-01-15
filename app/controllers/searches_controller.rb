class SearchesController < ApplicationController
  def result
    @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("name like ?", "%#{params[:search_text]}%")
  end
end
