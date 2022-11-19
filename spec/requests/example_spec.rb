require 'rails_helper'
require 'nokogiri'

RSpec.describe "Examples", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/example/show", params: {digit:78}
      expect(response).to have_http_status(:success)
    end
  end
    context 'shouldn`t redirect and return http Error if' do
      it 'redirecting was without params' do
        get '/example/show'
        expect(response).to have_http_status(302)
      end

      it 'input 88uu ' do
        get '/example/show', params: {digit: '67ff'}
        expect(response).to have_http_status(302)
      end

      it 'input h7' do
        get '/example/show', params: {digit: 'h7'}
        expect(response).to have_http_status(302)
      end
      it 'input words' do
        get '/example/show', params: {digit: 'ubuntu'}
        expect(response).to have_http_status(302)
      end
    end

    context 'should return body contains' do
      it 'number 78' do
        get '/example/show', params: {digit: 78}
        html = Nokogiri::HTML(response.body)
        expects = [0,0,1,1,2,4,3,9,11,121,22,484]
        expects.each_with_index do |el, idx|
          div = html.search('td')[idx.to_i].text.to_i
          expect(div).to eq(el)
        end
      end
      it 'number 78' do
        get '/example/show', params: {digit: 78}
        html = Nokogiri::HTML(response.body)
        div = html.search('h3').text
        expect(div).to eq("Количество: 6 ")
      end
    end
end
