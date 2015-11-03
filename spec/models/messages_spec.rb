require 'spec_helper'
require 'rails_helper'

VCR.configure do |c|
  c.ignore_localhost = true
end

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(body: "hello", to: "4086669559", from: "9189927038" )
    expect(message.save).to eq(false)
  end
  it "adds an error if the number is invalid" do
    message = Message.new(body: 'bhdsafd', to: '2121231', from: "9189927038" )
    message.save
    expect(message.errors[:base].first).to eq "The 'To' number 2121231 is not a valid phone number."
  end

end
