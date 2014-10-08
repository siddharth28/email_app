class MailBox < ActiveRecord::Base
  has_many :contacts
  has_many :friends, through: :contacts, source: 'MailBox'
  has_many :received_emails, through: 'receiver'
  has_many :sent_emails, class_name: 'Email'
end
