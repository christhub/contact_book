class Message < ActiveRecord::Base
  before_create :send_sms

  private

  def send_sms
    response = RestClient::Request.new(
        method: :post,
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACee52a683252f9c29fe173e51e7aeb9cf/Messages.json',
        user: 'ACee52a683252f9c29fe173e51e7aeb9cf',
        password: 'ccc4d4f4b9f84daaff54e300121bc313',
        payload: {
                  Body: body,
                  From: from,
                  To: to
        }
      ).execute

  end
end
