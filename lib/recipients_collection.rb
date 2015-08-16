class RecipientsCollection
  include Enumerable

  def initialize(string,
                 string_splitter: StringSplitter.new,
                 email_validator: EmailValidator.new)
    @emails = string_splitter.call(string)
    @email_validator = email_validator
  end

  def each(&block)
    @emails.each(&block)
  end

  def valid?
    all? { |email| @email_validator.call(email) }
  end

  def emails
    @emails ||= []
  end
end
