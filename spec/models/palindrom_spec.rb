require 'rails_helper'

# RSpec.describe Palindrom, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe 'Palindrom', type: :request do
  # Проверка на успешные get запросы
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST/result' do
    subject {post result_path, params:{digit:78}, xhr: true}
    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
