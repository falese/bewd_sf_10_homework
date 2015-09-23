class ReviewsController < ApplicationController
before_action :set_reviewable_item

  def index
  end

  def show
  end

  def new
    @review = @reviewable_item.reviews.build
  end

  def create
    @review = @reviewable_item.reviews.build(review_params)
    if @review.save
      redirect_to @reviewable_item
    else
      render 'new'
    end
  end

  def edit
  end

  def updated
  end

  def destroy
  end

end

private
def set_reviewable_item
  reviewable_item = [Artist, Song].detect{|c| params["#{c.name.underscore}_id"]}   #this figures out which class the request comes from
        @reviewable_item = reviewable_item.find(params["#{reviewable_item.name.underscore}_id"]) #this sets the appropriate foreign key
end

def review_params
    params.require(:review).permit(:author, :body)
end

def get_review
end
