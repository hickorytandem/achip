module ApplicationHelper
  def avatar_for(user, class_name)
    @avatar = user.avatar
    if @avatar.attached?
      @avatar_user = cl_image_tag(@avatar.key, alt: user.name, class: class_name)
    else
      @avatar_user = image_tag("default_avatar.png", alt: user.name, class: class_name)
    end
    return @avatar_user
  end
end
