class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @articles = Article.where(topic_id: @article.topic_id)
    @topics = Topic.all
    @topic =Topic.find(@article.topic_id)
  end
end
