class CreateUserRecommended
  include Sidekiq::Worker

  def perform(*_args)
    now = Time.current
    User
      .where(
        "everyday_news_delivery_time::TIME > ? AND everyday_news_delivery_time::TIME < ?",
        now,
        now + 6.minute
      )
      .each(&method(:create_user_recommended_news_history_articles))
  end

  private

  def create_user_recommended_news_history_articles(user)
    now = Date.current
    created_at = user.everyday_news_delivery_time.to_datetime.change(
      year: now.year,
      month: now.month,
    )
    prev_history = user.user_recommended_news_histories.order(created_at: :desc).limit(1).first
    prev_delivery_time = prev_history ? prev_history.created_at : DateTime.new(2000)
    history = user.user_recommended_news_histories.create(created_at: created_at)
    target_articles = Article.where("written_at > ? AND written_at <= ?", prev_delivery_time, created_at)
    delivery_articles = user.user_topic_insigtht.order(views: :desc).map do |user_topic_insigtht|
      target_articles.where(topic_id: user_topic_insigtht.topic_id).to_ary
    end.flatten[0, 5]
    delivery_articles.each do |article|
      history.user_recommended_news_history_articles.create(article: article)
    end
  end
end
