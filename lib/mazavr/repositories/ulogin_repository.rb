class UloginRepository
  module Types
    include Dry::Types.module
  end

  class UserInfo < Dry::Struct
    attribute :first_name, Types::Strict::String
    attribute :last_name, Types::Strict::String
    attribute :network, Types::Strict::String
    attribute :identity, Types::Strict::String
    attribute :raw_data, Types::Strict::String.optional

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
      raw_data: user_info_raw
    )
  end

  def user_info_json
     Hanami::Utils::Hash.symbolize JSON.parse(user_info_raw)
  end

  def user_info_raw
    @user_info_raw ||= open("http://ulogin.ru/token.php?token=#{@token}&host=#{ENV.fetch('DOMAIN_NAME')}").read
  end
end
