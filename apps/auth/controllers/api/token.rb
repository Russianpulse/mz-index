module Auth::Controllers::Api
  class Token
    include Auth::Action

    def call(params)
      self.headers.merge!({ 'Access-Control-Allow-Origin' => '*' })
      self.format = :json
      self.body = { token: user_info_jwt, expire: expire }.to_json
    end

    private

    def user_info_jwt
      JWT.encode({ id: 123, expire: expire }, ENV.fetch('JWT_SECRET'), 'HS256')
    end

    def expire
      Time.now.to_i + 180
    end
  end
end
