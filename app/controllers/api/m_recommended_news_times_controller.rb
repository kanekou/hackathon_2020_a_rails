class MRecommendedNewsTimesController < ApiController
  def index
    response = {
      m_recommended_news_times: MRecommendedNewsTime.all.map do |m_recomended_news_time|
        m_recomended_news_time.attributes.slice("recommended_time", "period")
      end
    }
    render json: response
  end
end
