class UloginRepository
  module Types
    include Dry::Types.module
  end

  class UserInfo < Dry::Struct
    attribute :first_name, Types::Strict::String
    attribute :last_name, Types::Strict::String
    attribute :network, Types::Strict::String
    attribute :identity, Types::Strict::String

    def name
      "#{first_name} #{last_name}"
    end
  end

  def initialize(token)
    @token = token
  end

  def user_info
    UserInfo.new(
      first_name: user_info_json[:first_name],
      last_name: user_info_json[:last_name],
      network: 'vkontakte',
      identity: '123',
    )
  end

  def user_info_json
  end

  def user_info_raw
  end
end
