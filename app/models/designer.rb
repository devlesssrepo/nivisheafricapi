class Designer < ApplicationRecord
  attr_accessor :activation_token , :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  
  has_many :collections
  belongs_to :country

  validates :design_label,  presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :phone_number, presence: true, numericality: true, length: { maximum: 25 }, uniqueness: true
  validates :email_address, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :physical_address, presence: true
  validates :password, length: { minimum: 8 }

  has_secure_password

  def send_activation_email
    DesignerMailer.account_activation(self).deliver_now
  end
    
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def Designer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Designer.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = Designer.new_token
    update_attribute(:reset_digest, Designer.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    DesignerMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 4.hours.ago
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_activation_digest
    self.activation_token = Designer.new_token
    self.activation_digest = Designer.digest(activation_token)
  end

  private
  def downcase_email
    self.email_address = email_address.downcase
  end
end