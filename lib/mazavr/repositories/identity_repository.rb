class IdentityRepository < Hanami::Repository
  def find_by_uid(uid)
    identities.where(uid: uid).first
  end
end
