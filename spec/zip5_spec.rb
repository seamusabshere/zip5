require 'spec_helper'

describe Zip5 do
  {
    999501234  => '99950',
  '99950-1234' => '99950',
     57531234  => '05753',
   '5753-1234' => '05753',
  '05753-1234' => '05753',
      5011234  => '00501',
    99950      => '99950',
     5753      => '05753',
     1000      => '01000',
      501      => '00501',
           ''  => nil,
        'abc'  => nil,
  }.each do |input, expected|
    it "parses #{input.inspect} as #{expected.inspect}" do
      expect(Zip5.zip5(input)).to eq(expected)
    end
    # here we also test 57531234.0, etc.
    if input.is_a?(Integer)
      input_f = input.to_f
      it "parses #{input_f.inspect} as #{expected.inspect}" do
        expect(Zip5.zip5(input_f)).to eq(expected)
      end
    end
  end
end
