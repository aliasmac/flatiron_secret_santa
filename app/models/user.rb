class User < ApplicationRecord
  has_many :invitations
  has_many :groups, through: :invitations
  has_one :wishlist
  has_many :gifts, through: :wishlist
  has_secure_password

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  # validates_uniqueness_of :email, :message => "Oups... it seams that you already have an account!"
  # validate do |user|
  #   user.errors.add_to_base("Oups... it seams that you already have an account!") if user.errors.messages.include?(:email)
  # end
end
