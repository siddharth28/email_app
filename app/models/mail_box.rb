class MailBox < ActiveRecord::Base
  # FIXME_AK: do we need to preserve contacts when the MailBox is destroyed?
  has_many :contacts
  has_many :friends, through: :contacts, source: 'MailBox'
  # FIXME_AK: Why through: is in single quotes? 
  has_many :received_emails, through: 'receiver'
  # FIXME_AK: no need for single quotes in class_name.
  has_many :sent_emails, class_name: 'Email'
end
