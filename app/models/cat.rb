class Cat < ApplicationRecord
    validates :name, :age, :enjoys, :image, presence: true
    validates :enjoys, length: { minimum: 10 }
end
