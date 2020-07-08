module Concerns::ErrorHandler
  extend ::ActiveSupport::Concern


  def render_not_found(err)
    respond(:record_not_found,404,err)
  end

  def respond(_error, _status, _message)
    render json: {
        error: _error,
        status: _status,
        message: _message
    }
  end

end