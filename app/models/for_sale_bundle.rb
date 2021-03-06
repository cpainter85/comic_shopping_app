class ForSaleBundle < ActiveRecord::Base
  belongs_to :volume
  belongs_to :vendor

  validates :name, presence: true
  validates :volume_id, presence: true
  validates :vendor_id, presence: true

  def extract_issue_numbers_from_bundle
    if self.name.include? '#'
      self.name.slice(self.name.index('#')...self.name.index('Bundle')).strip
    else
      'Big Bundle'
    end
  end

  def extract_first_number_from_bundle
    if self.name.include? '#'
      self.name.slice((self.name.index('#')+1)...self.name.index('-')).strip.to_i
    else
      0
    end
  end

  def price_in_dollars
    if self.price_in_cents == 0
      'FREE'
    else
      "$#{self.price_in_cents.to_f/100}"
    end
  end
end
