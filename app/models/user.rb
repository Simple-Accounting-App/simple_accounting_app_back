class User < ApplicationRecord
  has_many :accounts, dependent: :destroy

  DEFAULT_USER_ID = 1
end
