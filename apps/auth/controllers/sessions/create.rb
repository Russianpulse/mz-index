require 'open-uri'

module Auth::Controllers::Sessions
  class Create
    include Auth::Action

    expose :user

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

      @user = user
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

    # {"last_name"=>"Удалов", "uid"=>"143148639", "identity"=>"http://vk.com/id143148639", "network"=>"vkontakte", "first_name"=>"Сергей", "profile"=>"http://vk.com/id143148639"}"
    #
    # {"last_name"=>"Удалов", "uid"=>"111385910029480216808", "identity"=>"https://plus.google.com/u/0/111385910029480216808/", "network"=>"google", "first_name"=>"Сергей", "profile"=>"https://plus.google.com/+СергейУдалов"}
    def user_info
      ulogin_repository.user_info
    end

    def verify_csrf_token?
      false
    end
  end
end
