require 'rails_helper'

RSpec.describe 'UploadCsvs', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/upload_csv/new'
      expect(response).to have_http_status(:success)
    end
  end
end
