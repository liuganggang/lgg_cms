module LggBlog
  class APIV1 < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json
    default_format :json
    helpers V1::Helpers

    mount V1::CategoryApi

    # http://localhost:3000/api/v1/status.json
    desc "v1 status"
    get '/status' do
      'OK'
    end

    add_swagger_documentation mount_path: "/api-doc", api_version: "v1"
  end
end
