module LggBlog
  module V1
    module CustomFormatter
      def self.call(message, backtrace, options, env, original_exception)
        if message.is_a?(Hash)
          { status: 0 }.merge(message).to_json
        else
          { status: 0, message: message }.to_json
        end
      end
    end
  end
end
