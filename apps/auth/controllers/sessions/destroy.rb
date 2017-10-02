module Auth::Controllers::Sessions
  class Destroy
    include Auth::Action

    def call(params)
      session[:user_id] = nil

      redirect_to '/me/auth'
    end
  end
end
