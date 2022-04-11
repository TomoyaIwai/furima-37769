class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :region
  belongs_to :schedule

  validates :title, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :info, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }


end
