module Auth::Controllers::Sessions
  class Create
    include Auth::Action

    expose :user

    def call(params, identity_repository: IdentityRepository.new, user_repository: UserRepository.new)
      user = user_repository.create(
        name: params[:name]
      )
      identity_repository.create(
        user_id: user.id,
        provider: params[:provider],
        uid: params[:email],
      )

      @user = user
    end

    def verify_csrf_token?
      false
    end
  end
end
