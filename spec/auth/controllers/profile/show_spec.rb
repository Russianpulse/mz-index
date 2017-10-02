require_relative '../../../../apps/auth/controllers/profile/show'

RSpec.describe Auth::Controllers::Profile::Show do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
