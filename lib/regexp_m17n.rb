module RegexpM17N
  def self.non_empty?(str)
    strDup = str.dup # avoid changing the encoding of the original string
    strDup.force_encoding(Encoding::BINARY) if strDup.encoding.dummy?
    strDup =~ Regexp.new('^.+$'.encode(strDup.encoding), Regexp::FIXEDENCODING)
  end
end