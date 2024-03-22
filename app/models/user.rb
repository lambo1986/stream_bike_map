class User < ApplicationRecord
  has_many :trips

  validates :first_name, :last_name, :email, presence: true
end
