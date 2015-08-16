class SurveyInviterValidation < SimpleDelegator
  def initialize(survey_inviter)
    super(survey_inviter)
  end

  def valid?
    valid_message? && valid_recipients?
  end

  private

  def valid_message?
    message.present?
  end

  def valid_recipients?
    recipients.valid?
  end
end
