module LggBlog
  class APIV2 < Grape::API
    version 'v2', using: :path
    prefix 'api'
    format :json
    default_format :json

    rescue_from :all do |e|
      Rails.logger.error "Grape rescue_from :all Exception: #{e.message}\n\n#{e.backtrace.join("\n")}"
      error!("#{e.message}", 200)
    end

    # http://localhost:3000/api/v2/status.json
    desc "v2 status"
    get '/status' do
      'OK'
    end
    add_swagger_documentation mount_path: "/api-doc", api_version: "v2"
  end
end
