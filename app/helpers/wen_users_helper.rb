module WenUsersHelper
   # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(wen_user)
    gravatar_id = Digest::MD5::hexdigest(wen_user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: wen_user.name, class: "gravatar")
  end
end
