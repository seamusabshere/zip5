require "zip5/version"

module Zip5
  VALID = 501..99950
  
  def Zip5.zip5(input)
    input = input.to_i.to_s.delete('-')
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
end
