class UpvotesController < ApplicationController

    def add_vote
        session[:comics_upvoted] = [] if session[:comics_upvoted].nil?
        session[:comics_upvoted] << params[:id]
        redirect_to '/comics/index'
    end

    def remove_vote
        session[:comics_upvoted].delete(params[:id])
        redirect_to '/comics/index'

    end
end
