require 'spec_helper'

describe EmailValidator, '#valid?' do
  before do
    @validator = described_class.new
  end

  it 'is valid when email is in valid format' do
    result = @validator.call('valid@example.com')
    expect(result).to be true
  end

  it 'is invalid when email is wrong format' do
    result = @validator.call('invalid')
    expect(result).to be false
  end
end
