class OmniAuthIdentityRepository
  def self.create(*args)
    new.create(*args)
  end

  def create(attrs)
    unencrypted_password = attrs[:password]

    BCrypt::Password.create(unencrypted_password)

    repository.create(
      provider: 'password',
      uid: attrs[:email]
    )
  end

  private

  def repository
    IdentityRepository.new
  end
end
