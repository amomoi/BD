class Bdsensor < ApplicationRecord
  belongs_to :bdtipo
  belongs_to :bdcliente
  has_many :bdleituras
end
