require 'open-uri'

module Auth::Controllers::Sessions
  class Create
    include Auth::Action

    def call(params)
      @params = params

      session[:user_id] = user.id

      redirect_to '/me'
    end

    private

    def find_user_by_identity
      identity = identity_repository.find_by_uid(new_identity.uid)
      user_repository.find(identity.user_id)
    end

    def user
      @user ||= if identity_exists?
                  find_user_by_identity
                else
                  register_new_user
                end
    end

    def register_new_user
      u = user_repository.create(
        name: user_info.name
      )

      identity_repository.create identity_attributes.merge(user_id: u.id)
    end

    def identity_attributes
      { provider: user_info.network, uid: user_info.identity, extra: user_info.raw_data }
    end

    def new_identity
      Identity.new identity_attributes
    end

    def identity_exists?
      !identity_repository.find_by_uid(new_identity.uid).nil?
    end

    def ulogin_repository
      ulogin_repository ||= UloginRepository.new(params[:token])
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
