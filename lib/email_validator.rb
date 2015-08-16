class EmailValidator
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  def initialize(email_regex: EMAIL_REGEX)
    @email_regex = email_regex
  end

  def call(email)
    !!email.match(@email_regex)
  end
end
