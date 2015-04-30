class ForSaleBundle < ActiveRecord::Base
  belongs_to :volume
  belongs_to :vendor

  validates :name, uniqueness: true

  def extract_issue_numbers_from_bundle
    if self.name.include? '#'
      self.name.slice(self.name.index('#')...self.name.index('Bundle')).strip
    end
  end

  def extract_first_number_from_bundle
    self.name.slice((self.name.index('#')+1)...self.name.index('-')).strip.to_i
  end

  def price_in_dollars
    if self.price_in_cents == 0
      'FREE'
    else
      "$#{self.price_in_cents.to_f/100}"
    end
  end
end
