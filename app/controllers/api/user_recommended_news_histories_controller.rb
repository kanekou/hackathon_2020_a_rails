class Api::UserRecommendedNewsHistoriesController < ApiController
  def index
    response = {
      user_recommended_news_histories:
        current_user.user_recommended_news_histories.map do |history|
          { created_at: histroy.created_at.strftime("%Y/%m/%d %H:%M") }
        end
    }
    render json: response
  end
end
