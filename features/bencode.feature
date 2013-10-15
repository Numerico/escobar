Feature: Interpret Bencode
  Bencode is the encoding used by BitTorrent protocol for storing and transmitting (loosely structured) data.
  Most known inside .torrent files
  http://en.wikipedia.org/wiki/Bencode

  Scenario: Read Bencoded string
    Given "4:spam" is parsed as Bencode
      Then I should get back "spam" as "String"

  Scenario: Wrong Bencoded string
    Given "5:spam" is parsed as Bencode
      Then an error should be raised

  Scenario: Write Bencoded string
    Given "spam" is parsed to Bencode
      Then I should get back "4:spam" as "String"

  Scenario: Read Bencoded integer
    Given "i3e" is parsed as Bencode
      Then I should get back "3" as "Integer"

  Scenario: Write Bencoded integer
    Given "88 (Integer)" is parsed to Bencode
      Then I should get back "i88e" as "String"

  Scenario: Read Bencoded negative integer
    Given "i-3e" is parsed as Bencode
      Then I should get back "-3" as "Integer"

  Scenario: Read Bencoded zero
    Given "i0e" is parsed as Bencode
      Then I should get back "0" as "Integer"
    But "i-0e" is parsed as Bencode
      Then an error should be raised

  Scenario: Leading zero integer
    Given "i03e" is parsed as Bencode
      Then an error should be raised
