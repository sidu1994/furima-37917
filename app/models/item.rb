class Item < ApplicationRecord
  belongs :user
  has_one_attached :image


  validates :name, presence: true
  validates :explanation ,presence: true
  validates :category_id ,presence: true
  validates :situation_id ,presence: true
  validates :load_id ,presence: true
  validates :area_id ,presence: true
  validates :deadline_id ,presence: true
  validates :price ,presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :deadline
  belongs_to :load
  belongs_to :situation
end

