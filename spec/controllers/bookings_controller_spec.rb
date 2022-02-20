# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:march_22) { FactoryBot.create(:march_22) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: march_22.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: march_22.id }
      expect(response).to have_http_status(:success)
    end
  end
end
