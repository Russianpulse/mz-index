require_relative '../../../../apps/auth/controllers/api/js'

RSpec.describe Auth::Controllers::Api::Js do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end