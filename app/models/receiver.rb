class Receiver < ActiveRecord::Base
  belongs_to :email
  belongs_to :mailbox
  validates :received_email_count
  scope :non_spam_emails, -> { joins(:email).where('email.spam' = true) }
  after_create :add_contact
  protected
    def received_email_count
      mailbox.received_emails.length < 10
    end
    def add_contact
      Contact.find_or_create_by(owner: mailbox, friend: email.sender)
    end
end
