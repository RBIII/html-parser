require 'rails_helper'

describe "Create Page:", type: :request do
  it 'Indexes a page off the valid url' do
    post "/api/v1/pages", page: {url: "https://stackoverflow.com"}, format: :json

    # test for the 200 status-code
    expect(response).to be_success
  end
end
