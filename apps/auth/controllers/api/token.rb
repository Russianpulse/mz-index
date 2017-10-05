module Auth::Controllers::Api
  class Token
    include Auth::Action

    EXPIRES_IN_SECONDS = 3600

    def call(params)
      #header("Access-Control-Allow-Origin: http://origin.domain:port");
      #header("Access-Control-Allow-Credentials: true");
      #header("Access-Control-Allow-Methods: GET, POST");
      #header("Access-Control-Allow-Headers: Content-Type, *");
      
     #self.headers.delete 'Content-Security-Policy'
     self.headers.merge!({ 'Access-Control-Allow-Origin' => '*' })
     self.headers.merge!({ 'Access-Control-Allow-Credentials' => 'true' })
     self.headers.merge!({ 'Access-Control-Allow-Methods' => 'GET, POST' })
     self.headers.merge!({ 'Access-Control-Allow-Headers' => 'Content-Type, *' })

      self.format = :json

      data = if user.nil?
               { status: :guest }
             else
               { status: :user, token: user_info_jwt, expires_in: EXPIRES_IN_SECONDS }
             end

      self.body = params[:callback].nil? ? data.to_json :  to_jsonp(data)
    end

    private

    def to_jsonp(data)
      "#{params[:callback]}(#{data.to_json});"
    end

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
