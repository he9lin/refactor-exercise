require 'spec_helper'

describe RecipientsCollection do
  describe '#initialize' do
    it 'splits emails on commas' do
      recipients = described_class.new('one@example.com,two@example.com')
      expect(recipients.emails).to match_array(['one@example.com', 'two@example.com'])
    end

    it 'splits emails on semicolons' do
      recipients = described_class.new('one@example.com;two@example.com')
      expect(recipients.emails).to match_array(['one@example.com', 'two@example.com'])
    end

    it 'strips spaces' do
      recipients = described_class.new('  one@example.com;  two@example.com  ')
      expect(recipients.emails).to match_array(['one@example.com', 'two@example.com'])
    end
  end

  describe '#valid?' do
    it 'is valid if all emails are valid' do
      recipients = described_class.new('one@example.com;two@example.com')
      expect(recipients).to be_valid
    end

    it 'is not valid if any emails are not valid' do
      recipients = described_class.new('invalid;two@example.com')
      expect(recipients).not_to be_valid
    end
  end
end
