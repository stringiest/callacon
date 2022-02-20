# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:orient_horror) { FactoryBot.create(:orient_horror) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    xit 'returns http success' do
      get :edit, params: { id: orient_horror.id }
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
    xit 'returns http success' do
      get :show, params: { id: orient_horror.id }
      expect(response).to have_http_status(:success)
    end
  end
end
