class User < ApplicationRecord
    has_many :memberships  , dependent: :destroy
    has_many :groups, through: :memberships , dependent: :destroy
  end