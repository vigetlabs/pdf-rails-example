class Pdf < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :attachment

end
