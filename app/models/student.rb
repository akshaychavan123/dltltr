class Student < ApplicationRecord
    has_many :posts , dependent: :destroy
    has_one :clas , dependent: :destroy
end
