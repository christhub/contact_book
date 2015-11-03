class CreateContactsMessages < ActiveRecord::Migration
  def change
    create_table :contacts_messages do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :message, index: true
    end
  end
end
