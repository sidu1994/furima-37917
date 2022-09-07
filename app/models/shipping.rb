class Shipping < ApplicationRecord
  belongs_to :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
