class VendorData < ActiveRecord::Base
  require 'nokogiri'
  require 'open-uri'

  def self.comixology_retrieve_comics(url)
    doc = Nokogiri::HTML(open(url))

    issues = doc.css('.Issues')
    
    c = issues.css('li.content-item')
    c.each do |issue|

      url = issue.css('.content-cover').xpath('a').first.attributes['href'].value
      if issue.css('.content-info').css('.content-subtitle').empty?
        title = issue.css('.content-info').css('.content-title').first.children.to_s
      else
        title = issue.css('.content-info').css('.content-subtitle').first.children.to_s
      end
      string_dollar_price = issue.css('.item-price').first.children.to_s
      price_in_cents = (string_dollar_price.delete('$').to_f*100).to_i
      comic = VendorData.new
      comic.title = title
      comic.url = url
      comic.price_in_cents = price_in_cents
      comic.save
    end
  end

  def self.dhd_retrieve_comics(url)
    require 'sanitize'

    doc = Nokogiri::HTML(open(url))

    comics = doc.css('.profile','.approved')
    comics.each do |comic|
      url = comic.xpath('a').first.attributes['href'].value.to_s
      title = comic.xpath('a').first.attributes['title'].value
      price = comic.css('a.ajax-submit.button.blue')
      price_in_cents = ((Sanitize.fragment(price.to_s).delete '$').to_f*100).to_i

      dhd_comic = VendorData.new
      dhd_comic.title = title
      dhd_comic.price_in_cents = price_in_cents
      dhd_comic.url = 'https://digital.darkhorse.com' + url
      dhd_comic.save
    end

  end

  # def extract_volume_name_from_title
  #   if self.title.include? '#'
  #     self.title.slice(0...(self.title.index('#'))).strip
  #   else
  #     self.title
  #   end
  # end

  def extract_issue_number_from_title
    if self.title.include? '#'
      self.title.slice(((self.title.index('#'))+1)..self.title.length).strip
    else
      '1'
    end
  end

  def comixology_make_for_sale(volume)
    issue = Volume.find(volume).issues.find_by(issue_number: self.extract_issue_number_from_title)
    if issue
      for_sale = issue.for_sale_comics.new(vendor_id: Vendor.find_by(name: 'Comixology').id)
      for_sale.price_in_cents = self.price_in_cents
      for_sale.url = self.url
      for_sale.save
    end
  end

  def dhd_make_for_sale(volume)

    if self.title.include? 'Bundle'
      bundle = Volume.find(volume).for_sale_bundles.new(vendor_id: Vendor.find_by(name: "Dark Horse Digital").id)
      bundle.name = self.title
      bundle.price_in_cents = self.price_in_cents
      bundle.url = self.url
      bundle.save
    else
      issue = Volume.find(volume).issues.find_by(issue_number: self.extract_issue_number_from_title)
      if issue
        for_sale = issue.for_sale_comics.new(vendor_id: Vendor.find_by(name: "Dark Horse Digital").id)
        for_sale.price_in_cents = self.price_in_cents
        for_sale.url = self.url
        for_sale.save
      end
    end
  end

end
