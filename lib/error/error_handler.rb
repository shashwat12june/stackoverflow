module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end

      end
    end

    private

    def respond(_error, _status, _message)
      render json: {
          error: _error,
          status: _status,
          message: _message
      }
    end
  end
end