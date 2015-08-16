require 'spec_helper'

describe SurveyInviterValidation do
  it 'is valid when both message is present and receipents are valid' do
    recipients = double(:recipients, valid?: true)
    survey_invitor = double(:survey_invitor, recipients: recipients, message: 'message')
    expect(described_class.new(survey_invitor)).to be_valid
  end

  it 'is invalid when message is present' do
    recipients = double(:recipients, valid?: true)
    survey_invitor = double(:survey_invitor, recipients: recipients, message: '')
    expect(described_class.new(survey_invitor)).not_to be_valid
  end

  it 'is invalid when recipients are invalid' do
    recipients = double(:recipients, valid?: false)
    survey_invitor = double(:survey_invitor, recipients: recipients, message: 'message')
    expect(described_class.new(survey_invitor)).not_to be_valid
  end
end
