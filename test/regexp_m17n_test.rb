# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      begin
        assert(RegexpM17N.non_empty?('.'.encode(enc)))
      rescue Encoding::ConverterNotFoundError
        # ruby 2.1 does not have UTF-8 to ISO-2022-JP-2 converter (actually can use iconv gem here, but it's not good)
        assert(RegexpM17N.non_empty?('.'.force_encoding(enc)))
      end
    end
  end
end
