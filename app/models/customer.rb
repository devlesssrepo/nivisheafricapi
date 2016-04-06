class Customer < ApplicationRecord
  attr_accessor :activation_token , :reset_token
  belongs_to  :country
  
  before_save :downcase_email
  before_create :create_activation_digest

  validates :email_address, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, length: {maximum: 15}, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password

  def cart
    OrderDetails.find_by(customer: self, status: false)
  end

  def send_activation_email
    CustomerMailer.account_activation(self).deliver_now
  end
    
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def Customer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Customer.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = Customer.new_token
    update_attribute(:reset_digest, Customer.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    CustomerMailer.password_reset(self).deliver_now
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
    self.activation_token = Customer.new_token
    self.activation_digest = Customer.digest(activation_token)
  end

  private
  def downcase_email
    self.email_address = email_address.downcase
  end
end