class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /[\w+\-.]+@[a-zA-Z\d\-.]+\.[a-zA-Z]+/
  validates :name, presence: true, length: { maximum: 50, minimum: 5}
  validates :email, presence: true, length: { maximum: 255, minimum: 6 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }

end
