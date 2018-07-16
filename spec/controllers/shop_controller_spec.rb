RSpec.describe ShopController do
  describe 'GET #index' do
    before { dispatch }

    it { expect(response).to have_http_status(:success) }
  end
end
