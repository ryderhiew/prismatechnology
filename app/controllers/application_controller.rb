class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def show
      if valid_page?
        render template: "#{params[:page]}"
      else
        render file: "public/404.html", status: :not_found
      end
    end

    private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/#{params[:page]}.html.erb"))
    end


end
