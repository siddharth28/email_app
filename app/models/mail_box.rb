class MailBox < ActiveRecord::Base
  # FIXED
  # FIXME_AK: do we need to preserve contacts when the MailBox is destroyed?
  has_many :contacts, dependent: :destroy
  has_many :friends, through: :contacts, source: MailBox
  # FIXED
  # FIXME_AK: Why through: is in single quotes? 
  has_many :received_emails, through: :receiver
  # FIXED
  # FIXME_AK: no need for single quotes in class_name.
  has_many :sent_emails, class_name: Email
  before_destroy :check_emails

  protected
    def check_emails
      raise if received_emails.non_spam_emails.any?
    end
end
