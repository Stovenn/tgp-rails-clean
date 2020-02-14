class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true 
  validates :title, length: { minimum: 3 }
end
