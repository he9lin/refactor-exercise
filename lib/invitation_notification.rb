class InvitationNotification
  def call(invitation, message)
    Mailer.invitation_notification(invitation, message)
  end
end
