module Auth::Controllers::Api
  class Js
    include Auth::Action

    def call(params)
      self.format = :js
    end
  end
end
