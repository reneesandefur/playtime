# == Schema Information
#
# Table name: wishlists
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wishlist < ApplicationRecord
  has_many :site_managers, dependent: :destroy
  has_many :users, through: :site_managers

  has_many :wishlist_items, dependent: :destroy
  has_many :items, through: :wishlist_items

  validates :name, presence: true,
                   uniqueness: true
                   
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
