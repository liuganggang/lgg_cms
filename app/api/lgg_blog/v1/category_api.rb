module LggBlog
  module V1
    class CategoryApi < Grape::API
      # http://localhost:3000/api/v1/categories.json
      resource :categories do
        desc "get all categories" do
          summary 'summary1'
          detail 'more details1'
          # params  API::Entities::Status.documentation
          # success API::Entities::Entity
          # failure [[401, 'Unauthorized', 'Entities::Error']]
          named 'My named route1'
          # headers XAuthToken: {
          #           description: 'Validates your identity',
          #           required: true
          #         },
          #         XOptionalHeader: {
          #           description: 'Not really needed',
          #           required: false
          #         }
          # hidden false
          # deprecated false
          is_array true
          nickname 'nickname1'
          produces ['application/json']
          consumes ['application/json']
        end
        get '/' do
          aa = declared(params)

          categories = Category.all

          cookies[:status_count] ||= 0

          present :status, 1
          present :categories, categories
          present :user, current_user
          present :status_count, cookies[:status_count]
        end
      end
    end
  end
end
