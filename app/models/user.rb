class User < ActiveRecord::Base
  has_secure_password
  
  has_many :article
  has_many :comment

  
  validates :Email, presence: true,
		    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
		    uniqueness: { case_sensitive: false }


  validates :Name, presence: true, length: { maximum: 50 }
  validates :password_digest , presence: true,  length: {minimum: 6} 

end
