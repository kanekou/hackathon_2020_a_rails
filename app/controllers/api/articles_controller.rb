class Api::ArticlesController < ApiController
  def index
    return render plain: 'bad request', status: 400 unless params[:user_recommended_news_history_id]

    history = current_user.user_recommended_news_histories.find(params[:user_recommended_news_history_id])
    response = {
      articles: history.articles.map do |article|
        article.attributes.slice("url", "title", "summary", "image")
      end
    }
    render json: response
  end
end
