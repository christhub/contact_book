class Contact < ActiveRecord::Base
  has_and_belongs_to_many :messages

  def name
    first_name + ' ' + last_name
  end
end
