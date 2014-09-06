class UsersService
  def self.find_for_oauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email || "#{auth.uid}@#{auth.provider}.com"
      user.url = auth.info.urls.to_a.last[1]
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
