module RegexpM17N
  def self.non_empty?(str)
    str.encode!(Encoding::UTF_8) if str.encoding.dummy?
    r = Regexp.new('^.+$'.encode(str.encoding), Regexp::FIXEDENCODING)
    str =~ r
  end
end