class ApplicationController < ActionController::Base
  def render_404
    render 'shared/404', formats: [:html], status: 404
  end


end
