require 'spec_helper'
require 'rails_helper'


describe Message, vcr: true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(body: "hello", to: "4086669559", from: "9189927038" )
    # binding.pry
    expect(message.save).to eq(false)
  end
end
