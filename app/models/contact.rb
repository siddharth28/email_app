class Contact < ActiveRecord::Base
  # FIXME_AK: No need for single quotes.
  belongs_to :owner, class_name: 'MailBox'
  belongs_to :friend, class_name: 'MailBox'
end
