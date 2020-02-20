module LggBlog
  module V1
    class ArticleApi < Grape::API
      # http://localhost:3000/api/v1/categories.json
      resource :articles do
        desc "get all articles" do
          summary 'article list'
          detail 'get articles with all data'
        end
        get '/' do
          articles = Article.all
          {
            status: 1,
            articles: articles
          }
        end

        desc "get article"
        params do
          requires :id, type: Integer, desc: 'article ID.'
        end
        get '/show' do
          article = Article.find(params[:id])
          {
            status: 1,
            article: article
          }
        end

        desc "get article2"
        get 'info' do
          article = Article.take
          error! 'Access Denied', 200
        end
      end
    end
  end
end
