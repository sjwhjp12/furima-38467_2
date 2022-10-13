class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture
  validates :item_name            , presence: true
  validates :item_text            , presence: true
  validates :category_id          , presence: true, numericality: { other_than: 1 }
  validates :status_id            , presence: true, numericality: { other_than: 1 }
  validates :shipping_status_id   , presence: true, numericality: { other_than: 1 }
  validates :prefecture_id        , presence: true, numericality: { other_than: 0 }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 }
  validates :price                , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image                , presence: true

end