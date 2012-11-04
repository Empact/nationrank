class Reports::Publications::RatingsController < ApplicationController
  before_filter :require_login
  before_filter :load_publication

  layout 'modal'

  def new
    @rating = @publication.ratings.new
  end

  def create
    @rating = @publication.ratings.new(rating_params)
    if @rating.save
      flash.notice = 'Thanks!'
    else
      flash.alert = "We ran into some trouble with that: #{@rating.errors.full_messages.to_sentence}"
    end
    redirect_to :back
  end

  private

  def rating_params
    params.require(:rating).permit(:nation_name, :score, :rank)
  end
end
