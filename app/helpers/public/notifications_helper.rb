module Public::NotificationsHelper

  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_post
      post_path(notification.subject.post, anchor: "comment-#{notification.subject.id}")
    when :liked_to_own_post
      post_path(notification.subject.post)
    when :commented_to_own_post_comment
      post_path(notification.subject.post_comment.post, anchor: "reply_comment-#{notification.subject.id}")
    when :liked_to_own_post_comment
      post_path(notification.subject.post_comment.post)
    end
  end

end
