class Contact < ActiveRecord::Base
  belongs_to :owner, class_name: 'MailBox'
  belongs_to :friend, class_name: 'MailBox'
end
