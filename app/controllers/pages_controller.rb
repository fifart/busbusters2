class PagesController < ApplicationController
  def index
    @postings = Posting.all.order(created_at: :desc)
    @categories = Category.all
  end

  
def requests
    @postings = Posting.all.order(created_at: :desc).where(category_id: 1)
    @categories = Category.all
  end

  def declarations
    @postings = Posting.all.order(created_at: :desc).where(category_id: 2)
    @categories = Category.all
  end
end
