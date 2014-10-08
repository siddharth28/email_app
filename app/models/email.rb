class Email < ActiveRecord::Base
  has_many :receivers
  has_many :receiver_mailbox, through: 'receiver', source: 'mailbox'
  has_many :attachments
  has_many :replies, class_name: 'Email', foreign_key :reply_id
  belongs_to :reply, class_name: 'Email'
  belongs_to :sender, class_name: 'MailBox'
  delegate :images, :texts, to: :attachments
end
