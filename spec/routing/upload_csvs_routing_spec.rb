require 'rails_helper'

RSpec.describe UploadCsvsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/upload_csvs').to route_to('upload_csvs#index')
    end

    it 'routes to #new' do
      expect(get: '/upload_csvs/new').to route_to('upload_csvs#new')
    end

    it 'routes to #show' do
      expect(get: '/upload_csvs/1').to route_to('upload_csvs#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/upload_csvs/1/edit').to route_to('upload_csvs#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/upload_csvs').to route_to('upload_csvs#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/upload_csvs/1').to route_to('upload_csvs#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/upload_csvs/1').to route_to('upload_csvs#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/upload_csvs/1').to route_to('upload_csvs#destroy', id: '1')
    end
  end
end
