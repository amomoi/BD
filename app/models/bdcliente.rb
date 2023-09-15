class Bdcliente < ApplicationRecord
    has_many :bdusuarios
    has_many :bdsensors
end
