class User < ApplicationRecord
    has_many :places
    has_many :memories
    has_many :spots, through: :places
    has_secure_password
  end