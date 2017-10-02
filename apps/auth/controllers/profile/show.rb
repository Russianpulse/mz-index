module Auth::Controllers::Profile
  class Show
    include Auth::Action
    accept :html, :json

    expose :user

    def call(params)
      redirect_to '/me/auth' if user.nil?

      @user = user

      if params[:format] == 'jwt'
        self.format = :jwt
        self.body = user_info_jwt
      end

    end

    private

    def user_info_jwt
      JWT.encode({ id: 123, t: Time.now.to_i }, ENV.fetch('JWT_SECRET'), 'HS256')
    end

    def user_repository
      UserRepository.new
    end

    def user
      user_repository.find(session[:user_id])
    end
  end
end
