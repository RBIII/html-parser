class Api::V1::PagesController < Api::V1::BaseController
  include PagesHelper

  def create
    if valid_url?(page_params[:url])
      page = Page.new(page_params)
      page.parse_and_index

      if page.save
        respond_with page, json: page.to_json
      else
        respond_with page, json: page.errors.full_messages.first
      end
    else
      render json: {"Error": "Invalid Url" }
    end
    head :ok
  end

  def index
    respond_with Page.all
  end

  private
  def page_params
    params.require(:page).permit(:url)
  end
end
