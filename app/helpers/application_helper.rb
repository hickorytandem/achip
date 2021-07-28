module ApplicationHelper
  def avatar_for(user, width = '', height = '')
    @avatar = user.avatar
    if @avatar.attached?
      @avatar_user = cl_image_tag(@avatar.key, alt: user.name, width: width, height: height)
    else
      @avatar_user = image_tag("default_avatar.png", alt: user.name, width: width, height: height)
    end
    return @avatar_user
  end
end
