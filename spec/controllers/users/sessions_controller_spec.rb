# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'GET #create' do
    let(:user) { create(:user) }

    it 'returns http success' do
      get :create, params: { email: user.email, password: user.password }

      expect(response).to have_http_status(:success)
      expect(response.headers).to include('access-token')
      expect(response.headers['access-token']).not_to be_empty
      expect(response.headers.to_h).to include_json('token-type' => 'Bearer')
      expect(JSON.parse(response.body)).to include_json(
        data: {
          id: user.id,
          email: user.email,
          uid: user.email,
          provider: 'email'
        }
      )
    end
  end
end
