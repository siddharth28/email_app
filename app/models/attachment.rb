class Attachment < ActiveRecord::Base
  belongs_to :email
  scope :images, -> { where(type: 'image') }
  scope :texts, -> { where(type: 'text') }
end
