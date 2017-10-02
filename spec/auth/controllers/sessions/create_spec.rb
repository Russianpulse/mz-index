require_relative '../../../../apps/auth/controllers/sessions/create'

RSpec.describe Auth::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:params) { { token: 'abc123aaaaaaaaaaaaaaaaaaaaa' } }
  let(:user_repository) { UserRepository.new }
  let(:identity_repository) { IdentityRepository.new }
  let(:user_info) do
    { last_name: 'Wilco', uid: '12345', identity: 'http://vk.com/id12345',
      network: 'vkontakte', first_name: 'Roger', profile: 'http://vk.com/id143148639'}
  end

  before do
    allow_any_instance_of(UloginRepository).to receive(:user_info_json) { user_info }
  end

  it 'should register a user' do
    expect do
      action.call params
    end.to change { user_repository.count }.by(1)

    user = user_repository.first
    expect(user.name).to eq 'Roger Wilco'

    identity = identity_repository.first
    expect(identity.provider).to eq 'vkontakte'
    expect(identity.uid).to eq 'http://vk.com/id12345'
  end

  context 'when user exists' do
    before do
      user = user_repository.create(name: 'Roger Wilco')

      identity_repository.create(
        user_id: user.id,
        provider: 'vkontakte',
        uid: 'http://vk.com/id12345',
      )
    end

    it 'should not register another user' do
      expect do
        action.call params
      end.not_to change { user_repository.count }
    end
  end
end
