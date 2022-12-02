require 'rails_helper'
require 'nokogiri'

RSpec.describe "Examples", type: :request do
  describe "GET /input" do
    before { get root_path } # перед каждым тестом делать запрос

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe "GET /show" do
    subject {post result_path, params:{digit:78}, xhr: true}
    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
  end
    context 'shouldn`t redirect and return http Error if' do
      before {  post result_path, xhr: true } 
      it 'redirecting was without params' do
        expect(response).to have_http_status(:success)
      end
      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end
      it 'assigns invalid model object' do
        expect(assigns(:arr).empty?).to be true
      end
    end
    context 'when params are ok' do 
      let (:digit) {78}
      before { post result_path, params: { digit:digit}, xhr: true }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders result templates' do
        expect(response).to render_template(:_result)
      end
      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end

      it 'assigns valid model object' do
        expect(assigns(:arr).empty?).to be false
      end
    end
end
