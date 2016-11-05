class Account < ApplicationRecord
  has_many :users, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  validates :name, presence: true
end
