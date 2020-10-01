module UsersHelper
  # Return the Gravatar for the given user.
  def gravatar_for(user)
    # gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_id = Digest::MD5::hexdigest("marcyri@gmail.com")
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=32&d=identicon&r=PG"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
