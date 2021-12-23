class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :info
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :send_price_id
      validates :area_id
      validates :send_day_id
    end
    with_options format: {with: /\A[0-9]+\z/} do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    end
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_price
  belongs_to :area
  belongs_to :send_day
end
