module Auth::Views::Sessions
  class Create
    include Auth::View

    def user_name
      user.name
    end
  end
end
