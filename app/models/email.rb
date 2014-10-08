class Email < ActiveRecord::Base
  has_many :receivers
  has_many :receiver_mailbox, through: 'receiver', source: 'mailbox'
  # FIXME_AK: do we need the preserve the attachments when Email is removeD?
  has_many :attachments
  has_many :replies, class_name: 'Email', foreign_key :reply_id
  belongs_to :reply, class_name: 'Email'
  belongs_to :sender, class_name: 'MailBox'
  # FIXME_AK: do we need the delegate here?
  delegate :images, :texts, to: :attachments
end
