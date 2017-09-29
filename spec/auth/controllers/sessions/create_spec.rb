require_relative '../../../../apps/auth/controllers/sessions/create'

RSpec.describe Auth::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:params) { { token: 'abc123aaaaaaaaaaaaaaaaaaaaa' } }
  let(:user_repository) { UserRepository.new }


  it 'should register a user' do
    expect do
      action.call params
    end.to change { user_repository.count }.by(1)
    puts user_repository.count
  end
end
