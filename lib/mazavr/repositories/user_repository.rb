class UserRepository < Hanami::Repository
  def count
    users.count
  end
end
