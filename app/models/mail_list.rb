class MailList < ApplicationRecord
  before_save :downcase_email
  
  validates :email_address, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: false }

  private
  def downcase_email
    self.email_address = email_address.downcase
  end
end
