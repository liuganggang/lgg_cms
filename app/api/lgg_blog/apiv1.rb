module LggBlog
  class APIV1 < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json
    default_format :json
    error_formatter :json, V1::CustomFormatter
    helpers V1::Helpers

    rescue_from :all do |e|
      Rails.logger.error "Grape rescue_from :all Exception: #{e.message}\n\n#{e.backtrace.join("\n")}"
      error!("#{e.message}", 200)
    end

    # custom raise Exception
    # rescue_from ActiveRecord::RecordNotFound do |e|
    #   error!({err_code: 999, message: "#{e.message}"}, 200)
    # end

    mount V1::CategoryApi
    mount V1::ArticleApi

    # http://localhost:3000/api/v1/status.json
    desc "v1 status"
    get '/status' do
      'OK'
    end

    add_swagger_documentation mount_path: "/api-doc", api_version: "v1"
  end
end
