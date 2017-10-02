require_relative '../../../../apps/auth/controllers/sessions/destroy'

RSpec.describe Auth::Controllers::Sessions::Destroy do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'should drop session' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
