class Tag < ApplicationRecord
  has_many :gossiptagjoins
  has_many :gossips, through: :gossiptagjoins 
end 
