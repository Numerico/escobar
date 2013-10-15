Feature: Interpret Bencode
  Bencode is the encoding used by BitTorrent protocol for storing and transmitting (loosely structured) data.
  Most known inside .torrent files
  http://en.wikipedia.org/wiki/Bencode

  Scenario: Read Bencoded string
    Given "4:spam" is parsed as Bencode
    Then I should get back "spam" as a "String"

  Scenario: Wrong Bencoded string
    Given "5:spam" is parsed as Bencode
    Then an error should be raised

  Scenario: Write Bencoded string
    Given "spam" is parsed to Bencode
    Then I should get back "4:spam" as a "String"
