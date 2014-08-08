module RegexpM17N
  def self.non_empty?(str)
    str.force_encoding(Encoding::BINARY) if str.encoding.dummy?
    str =~ Regexp.new('^.+$'.encode(str.encoding), Regexp::FIXEDENCODING)
  end
end