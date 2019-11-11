class Produto < ApplicationRecord

    belongs_to :departamento, optional: true

    validates :price, presence: true
    validates :name, length: { minimum: 4 }
end
