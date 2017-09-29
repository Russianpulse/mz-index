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
      network: user_info_json[:network],
      identity: user_info_json[:identity],
    )
  end

  def user_info_json
  end

  def user_info_raw
  end
end
