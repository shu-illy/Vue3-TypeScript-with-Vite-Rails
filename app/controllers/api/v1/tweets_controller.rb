module Api
  module V1
    class TweetsController < Api::V1::BaseApiController
      before_action :set_tweet, only: %i[ show edit update destroy ]
    
      # GET /tweets or /tweets.json
      def index
        @tweets = Tweet.all
        json_string = TweetSerializer.new(@tweets).serializable_hash.to_json
        render json: json_string
      end
    
      # POST /tweets or /tweets.json
      def create
        @tweet = Tweet.new(tweet_params)
    
        if @tweet.save
          json_string = TweetSerializer.new(@tweet).serializable_hash.to_json
          render json: json_string
        else
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
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
          params.require(:tweet).permit(:content)
        end
    end
  end
end
