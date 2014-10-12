class Contact < ActiveRecord::Base
  # FIXED
  # FIXME_AK: No need for single quotes.
  belongs_to :owner, class_name: MailBox
  belongs_to :friend, class_name: MailBox
  before_create :add_default_name
  after_create :reverse_contact

  private
    def add_default_name
      self.first_name = friend.first_name if !first_name.present?
    end
    def reverse_contact
      Contact.find_or_create_by(owner: friend, friend: owner )
    end
end
