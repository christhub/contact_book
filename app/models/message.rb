class Message < ActiveRecord::Base
  has_and_belongs_to_many :contacts

  before_create :send_sms

  private

  def send_sms
    contacts.each do |contact|
      begin
        response = RestClient::Request.new(
            method: :post,
            url: 'https://api.twilio.com/2010-04-01/Accounts/ACee52a683252f9c29fe173e51e7aeb9cf/Messages.json',
            user: ENV['TWILIO_ACCOUNT_SID'],
            password: ENV['TWILIO_AUTH_TOKEN'],
            payload: {
                      Body: body,
                      From: from,
                      To: contact.number
            }
          ).execute
      rescue Exception => e
        message = JSON.parse(e.response)['message']
        errors.add(:base, message)
        false
      end
    end
  end
end
