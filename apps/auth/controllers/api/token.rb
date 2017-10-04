module Auth::Controllers::Api
  class Token
    include Auth::Action

    EXPIRES_IN_SECONDS = 3600

    def call(params)
      self.headers.merge!({ 'Access-Control-Allow-Origin' => '*' })
      self.format = :json

      data = if user.nil?
               { status: :guest }
             else
               { status: :user, token: user_info_jwt, expires_in: EXPIRES_IN_SECONDS }
             end

      self.body = data.to_json
    end

    private

    def user_info_jwt
      JWT.encode({ id: user.id, expires_at: expires_at }, ENV.fetch('JWT_SECRET'), 'HS256')
    end

    def expires_at
      Time.now.to_i + EXPIRES_IN_SECONDS
    end

    def user_repository
      UserRepository.new
    end

    def user
      user_repository.find(session[:user_id])
    end
  end
end
