require_relative '../../../../apps/auth/controllers/sessions/create'

RSpec.describe Auth::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:params) { { token: 'abc123aaaaaaaaaaaaaaaaaaaaa' } }
  let(:user_repository) { UserRepository.new }
  let(:user_info) do
    { last_name: 'Wilco', uid: '12345', identity: 'http://vk.com/id12345',
      network: 'vkontakte', first_name: 'Roger', profile: 'http://vk.com/id143148639'}
  end

  before do
    allow_any_instance_of(UloginRepository).to receive(:user_info_json) { user_info }
  end

  it 'should register a user' do
    puts action.class
    expect do
      action.call params
    end.to change { user_repository.count }.by(1)

    user = user_repository.first
    expect(user.name).to eq 'Roger Wilco'
  end
end
