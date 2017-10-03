require_relative '../../../../apps/auth/controllers/api/token'

RSpec.describe Auth::Controllers::Api::Token do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
