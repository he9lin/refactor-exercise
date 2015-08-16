class ObservableInvitationFactory
  def initialize(invitation_class, observer)
    @invitation_class = invitation_class
    @observer = observer
  end

  def create(opts={})
    message = opts.delete(:message)
    invitation = @invitation_class.create(opts)
    notify(invitation, message)
  end

  private

  def notify(invitation, message)
    @observer.call(invitation, message)
  end
end
