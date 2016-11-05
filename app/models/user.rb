class User < ApplicationRecord
  belongs_to  :account
  has_many    :groups
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
