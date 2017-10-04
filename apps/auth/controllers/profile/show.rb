module Auth::Controllers::Profile
  class Show
    include Auth::Action

    expose :user

    def call(params)
      redirect_to '/me/auth' if user.nil?

      @user = user
    end

    private

    def user_repository
      UserRepository.new
    end

    def user
      user_repository.find(session[:user_id])
    end
  end
end
