require 'open-uri'

module Auth::Controllers::Sessions
  class Create
    include Auth::Action

    expose :user

    def call(params, identity_repository: IdentityRepository.new, user_repository: UserRepository.new, loginza_repository: LoginzaRepository.new)
      @params = params
      @loginza_repository = loginza_repository

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

    # {"last_name"=>"Удалов", "uid"=>"143148639", "identity"=>"http://vk.com/id143148639", "network"=>"vkontakte", "first_name"=>"Сергей", "profile"=>"http://vk.com/id143148639"}"
    #
    # {"last_name"=>"Удалов", "uid"=>"111385910029480216808", "identity"=>"https://plus.google.com/u/0/111385910029480216808/", "network"=>"google", "first_name"=>"Сергей", "profile"=>"https://plus.google.com/+СергейУдалов"}
    def user_info
      @loginza_repository.user_info @params[:token]
      #JSON.parse open("http://ulogin.ru/token.php?token=#{@params[:token]}&host=#{ENV.fetch('DOMAIN_NAME')}").read
    end

    def verify_csrf_token?
      false
    end
  end
end
