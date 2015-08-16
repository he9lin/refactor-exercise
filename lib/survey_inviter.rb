# Despite our best intentions, this class has acquired too many
# responsibilities.
#
# Here's an incomplete list:
#   1. Verifying that the message is valid.
#   2. Verifying that the recipient emails are valid.
#   3. Stripping spaces from email addresses.
#   4. Splitting email addresses on several delimiters.
#   5. Delivering invitations.
#
# TODO: Let's improve this code by extracting a new class to handle
# responsibilities 3 and 4. Create a new class to perform these tasks, and call
# it from this one.
class SurveyInviter
  def initialize(attributes = {})
    @survey             = attributes[:survey]
    @message            = attributes[:message] || ''
    @sender             = attributes[:sender]
    @recipients         = RecipientsCollection.new attributes[:recipients],
                            string_splitter: StringSplitter.new,
                            email_validator: EmailValidator.new
    @invitation_creator = ObservableInvitationFactory.new \
                            Invitation,
                            InvitationNotification.new
  end

  attr_reader :message, :recipients

  delegate :valid?, to: :survey_inviter_validation

  def deliver
    recipients.each do |email|
      create_invitation(email)
    end
  end

  private

  def create_invitation(email)
    @invitation_creator.create(
      survey:          @survey,
      sender:          @sender,
      recipient_email: email,
      status:          'pending',
      message:         message
    )
  end

  def survey_inviter_validation
    @survey_inviter_validation ||= SurveyInviterValidation.new(self)
  end
end
