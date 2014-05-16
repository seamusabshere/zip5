# Zip5

Convert United States zip codes to their correct Zip5 representation, even if they're missing a leading zero and/or they have the +4 suffix.

## Installation

Add this line to your application's Gemfile:

    gem 'zip5'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zip5

## Usage

Here it is in action:

```
>> Zip5.zip5(53703)    # Madison, WI
=> "53703"
>> Zip5.zip5(8840)     # Metuchen, NJ (missing a leading 0)
=> "08840"
>> Zip5.zip5(5011234)  # Holtsville, NY (missing a leading 0 AND with a +4 suffix, i.e. 00501-1234)
=> "00501"
```

Here's the output of the test suite:

```
Zip5
  parses 999501234 as "99950"
  parses 999501234.0 as "99950"
  parses "99950-1234" as "99950"
  parses 57531234 as "05753"
  parses 57531234.0 as "05753"
  parses "5753-1234" as "05753"
  parses "05753-1234" as "05753"
  parses 5011234 as "00501"
  parses 5011234.0 as "00501"
  parses 99950 as "99950"
  parses 99950.0 as "99950"
  parses 5753 as "05753"
  parses 5753.0 as "05753"
  parses 1000 as "01000"
  parses 1000.0 as "01000"
  parses 501 as "00501"
  parses 501.0 as "00501"
  parses "" as nil
  parses "abc" as nil
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/zip5/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
