require 'spec_helper'

describe Zip5 do
  {
    999500004  => ['99950', '0004'],
  '99950-0004' => ['99950', '0004'],
     57530004  => ['05753', '0004'],
   '5753-0004' => ['05753', '0004'],
  '05753-0004' => ['05753', '0004'],
      5010004  => ['00501', '0004'],
  '99950-4'    => ['99950', '0004'],
   '5753-4'    => ['05753', '0004'],
  '05753-4'    => ['05753', '0004'],
    99950      => ['99950', nil],
     5753      => ['05753', nil],
     1000      => ['01000', nil],
      501      => ['00501', nil],
           ''  => [nil, nil],
        'abc'  => [nil, nil],
  }.each do |input, expected|
    it "parses #{input.inspect} as #{expected.compact.join('-')}" do
      zip5, zip4 = expected
      expect(Zip5.zip5(input)).to eq(zip5)
      expect(Zip5.zip4(input)).to eq(zip4)
    end
    # here we also test 57530004.0, etc.
    if input.is_a?(Integer)
      input_f = input.to_f
      it "parses #{input_f.inspect} as #{expected.compact.join('-')}" do
        zip5, zip4 = expected
        expect(Zip5.zip5(input_f)).to eq(zip5)
        expect(Zip5.zip4(input_f)).to eq(zip4)
      end
    end
  end
end
