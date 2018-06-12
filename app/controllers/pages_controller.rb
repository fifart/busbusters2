class PagesController < ApplicationController
  def index
    @postings = Posting.all.order(created_at: :desc)
    @categories = Category.all
  end
end
