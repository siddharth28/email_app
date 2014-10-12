class Email < ActiveRecord::Base
  has_many :receivers
  has_many :receiver_mailbox, through: 'receiver', source: 'mailbox'
  # FIXED
  # FIXME_AK: do we need the preserve the attachments when Email is removeD?
  has_many :attachments, dependent: :destroy
  has_many :replies, class_name: Email, foreign_key :reply_id
  belongs_to :reply, class_name: Email
  belongs_to :sender, class_name: MailBox
  # FIXED
  # FIXME_AK: do we need the delegate here?
  validates :maximum_receivers
  before_create :check_spam, :add_default_subject
  after_create :log_data

  protected
    def maximum_receivers
      receivers.length =< 20
    end
    def check_spam
      self.spam = true if attachments.texts.any?
    end
    def add_default_subject
      self.subject = 'Default Subject' if !subject.present?
    end
end
