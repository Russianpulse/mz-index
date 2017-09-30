require 'open-uri'

module Auth::Controllers::Sessions
  class Create
    include Auth::Action

    def call(params)
      @params = params

      user = user_repository.create(
        name: user_info.name
      )

      identity_repository.create(
        user_id: user.id,
        provider: user_info.network,
        uid: user_info.identity,
      )

      session[:user_id] = user.id

      redirect_to '/me'
    end

    private

    def ulogin_repository
      ulogin_repository = UloginRepository.new(params[:token])
    end

    def identity_repository
      IdentityRepository.new
    end

    def user_repository
      UserRepository.new
    end

    def user_info
      ulogin_repository.user_info
    end

    def verify_csrf_token?
      false
    end
  end
end
