module ApplicationHelper
  def icon(str)
    "<i class=\"#{str}\"></i>".html_safe
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.png"
  end
end
