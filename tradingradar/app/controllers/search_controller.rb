class SearchController < ApplicationController
  def search
    query = params[:s] ? "%#{params[:s]}%" : nil

    @results = Stock.where("name LIKE ? OR keywords LIKE ?", query, query)

    @resultsOnBlog = Analysis.where("title LIKE ? OR description LIKE ?", query, query)
  end
end
