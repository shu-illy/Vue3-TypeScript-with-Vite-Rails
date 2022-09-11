module Api
  module V1
    class TweetsController < ApplicationController
      before_action :set_tweet, only: %i[ show edit update destroy ]
    
      # GET /tweets or /tweets.json
      def index
        @tweets = Tweet.all
      end
    
      # POST /tweets or /tweets.json
      def create
        @tweet = Tweet.new(tweet_params)
    
        respond_to do |format|
          if @tweet.save
            format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully created." }
            format.json { render :show, status: :created, location: @tweet }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @tweet.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /tweets/1 or /tweets/1.json
      def destroy
        @tweet.destroy
    
        respond_to do |format|
          format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_tweet
          @tweet = Tweet.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def tweet_params
          params.fetch(:tweet, {})
        end
    end
  end
end