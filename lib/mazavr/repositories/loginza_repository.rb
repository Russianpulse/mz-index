class LoginzaRepository
  class UserInfo
    def name
      'Roger Wilco'
    end

    def network
      'vkontakte'
    end

    def identity
      'http://vk.com/id1234'
    end
  end

  def user_info(token)
    UserInfo.new
  end
end
