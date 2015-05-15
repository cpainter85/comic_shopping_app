class Vendor < ActiveRecord::Base
  has_many :for_sale_comics, dependent: :destroy
  has_many :for_sale_bundles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
