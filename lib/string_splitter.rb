class StringSplitter
  def call(string)
    split sanitize(string)
  end

  private

  def sanitize(string)
    string.gsub(/\s+/, '')
  end

  def split(string)
    string.split(/[\n,;]+/)
  end
end

