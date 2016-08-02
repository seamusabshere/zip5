require "zip5/version"

module Zip5
  VALID = 501..99950
  
  def Zip5.zip5(input)
    input = input.to_i.to_s.gsub('-', '')
    memo = case input.length
    when 9
      input[0,5]
    when 8
      '0' + input[0,4]
    when 7
      '00' + input[0,3]
    when 5
      input
    when 4
      '0' + input
    when 3
      '00' + input
    else
      nil
    end
    if ENV['VERBOSE'] == 'true' and not VALID.include?(memo.to_i)
      $stderr.puts "warning: looks like a bad zip5 (expected 00500..99950): #{memo}"
    end
    memo
  end

  def Zip5.zip4(input)
    input = input.to_s.gsub(/\.\d*\z/, '')
    memo = nil
    if input =~ /\A\d+\-(\d+)\z/
      memo = $1.to_i
    elsif zip5 = zip5(input)
      hunk = zip5.gsub /\A0*/, ''
      pat = /\A0*#{hunk}/
      memo = input.gsub(pat, '').to_i
    end
    if memo and memo > 0
      '%04d' % memo.to_i
    end
  end
end
