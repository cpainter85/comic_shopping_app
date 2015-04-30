class ForSaleComic < ActiveRecord::Base
  belongs_to :issue
  belongs_to :vendor

  validates_uniqueness_of :issue_id, :scope => :vendor_id

  def price_in_dollars
    if self.price_in_cents == 0
      'FREE'
    else
      "$#{self.price_in_cents.to_f/100}"
    end
  end

end
