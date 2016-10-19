class YelpApi

  def self.client

    @client ||= Yelp::Client.new({
                            consumer_key: 'VgBqgM2m0cFktXaWg7MirA',
                            consumer_secret: 'CwavGnQCgdvdVY9fWELZ3ngWhjc',
                            token: '6ekU32QlnASLZQ29K6jV2iH8jg9M39ap',
                            token_secret: 'txCmSP_tTYILR2nNPXtJq30RhCQ'
                          })

  end


  def self.search(input, loc = "NYC")
    client.search(loc, input)
  end
end
