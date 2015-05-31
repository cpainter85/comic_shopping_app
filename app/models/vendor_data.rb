class VendorData < ActiveRecord::Base
  require 'nokogiri'
  require 'open-uri'

  def self.google_retrieve_comics(volume)
    volume.issues.order(:id).each do |issue|
      to_search = issue.full_title_with_year.gsub(' ', '%20').gsub('#', '%23')
      url = "https://play.google.com/store/search?q=#{to_search}&c=books"
      doc = Nokogiri::HTML(open(url))
      if doc.css('.details').length > 0
        title = doc.css('.details').first.css('.title').first.attributes['title']
        web_address = 'https://play.google.com/' + doc.css('.details').first.children.css('a').first.attributes['href'].value
        price_in_dollars = doc.css('.details').first.children.css('.display-price').text
        price_in_cents = (price_in_dollars.delete('$').to_f*100).to_i

        comic = VendorData.new
        comic.title = title
        comic.url = web_address
        comic.price_in_cents = price_in_cents
        comic.save
      end
    end
  end

  def self.google_retrieve_comics_issues(issues)
    issues.each do |issue|
      to_search = issue.full_title_without_year.gsub(' ', '%20').gsub('#', '%23')
      url = "https://play.google.com/store/search?q=#{to_search}&c=books"
      doc = Nokogiri::HTML(open(url))
      if doc.css('.details').length > 0
        title = doc.css('.details').first.css('.title').first.attributes['title']
        web_address = 'https://play.google.com/' + doc.css('.details').first.children.css('a').first.attributes['href'].value
        price_in_dollars = doc.css('.details').first.children.css('.display-price').text
        price_in_cents = (price_in_dollars.delete('$').to_f*100).to_i

        comic = VendorData.new
        comic.title = title
        comic.url = web_address
        comic.price_in_cents = price_in_cents
        comic.save
      end
    end
  end

  def self.google_retrieve_comics_without_year(volume)
    volume.issues.order(:id).each do |issue|
      to_search = issue.full_title_without_year.gsub(' ', '%20').gsub('#', '%23')
      url = "https://play.google.com/store/search?q=#{to_search}&c=books"
      doc = Nokogiri::HTML(open(url))
      if doc.css('.details').length > 0
        title = doc.css('.details').first.css('.title').first.attributes['title']
        web_address = 'https://play.google.com/' + doc.css('.details').first.children.css('a').first.attributes['href'].value
        price_in_dollars = doc.css('.details').first.children.css('.display-price').text
        price_in_cents = (price_in_dollars.delete('$').to_f*100).to_i

        comic = VendorData.new
        comic.title = title
        comic.url = web_address
        comic.price_in_cents = price_in_cents
        comic.save
      end
    end
  end

  # def self.image_retrieve_comics(volume)
  #   volume.issues.order(:id).each do |issue|
  #     issue_url = "https://imagecomics.com/comics/releases/#{issue.volume.name.gsub(' ', '-')}-#{issue.issue_number}"
  #     doc = Nokogiri::HTML(open(issue_url))
  #     comic = VendorData.new
  #     comic.url = issue_url
  #     comic.title = issue.issue_number
  #     if doc.at('.price:contains("Digital")')
  #       price = doc.at('.price:contains("Digital")').text
  #     else
  #       price = doc.css('.price').text
  #     end
  #     price_in_cents = (price.slice(price.index('$')+1..price.length).to_f*100).to_i
  #     comic.price_in_cents = price_in_cents
  #     comic.save
  #   end
  # end

  def self.image_retrieve_comics(volume)
    volume.issues.order(:id).each do |issue|
      issue_url = "https://imagecomics.com/store/comics/#{issue.volume.name.gsub(' ', '-')}-#{issue.issue_number}"
      doc = Nokogiri::HTML(open(issue_url))
      comic = VendorData.new
      comic.url = issue_url
      comic.title = issue.issue_number
      comic.price_in_cents = (doc.css('.price').text.delete('$').to_f*100).to_i
      comic.save
    end
  end

  def image_make_for_sale(volume)
    issue = Volume.find(volume).issues.find_by(issue_number: self.title)
    if issue
      for_sale = issue.for_sale_comics.new(vendor_id: Vendor.find_by(name: 'Image Comics Digital').id)
      for_sale.price_in_cents = self.price_in_cents
      for_sale.url = self.url
      for_sale.save
    end
  end

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

  def self.comixology_retrieve_gns(url)
    doc = Nokogiri::HTML(open(url))

    issues = doc.css('.GraphicNovels')
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

  # # def extract_volume_name_from_title
  # #   if self.title.include? '#'
  # #     self.title.slice(0...(self.title.index('#'))).strip
  # #   else
  # #     self.title
  # #   end
  # # end
  #
  def extract_issue_number_from_title
    if self.title.include? '#'
      self.title.slice(((self.title.index('#'))+1)..self.title.length).strip
    else
      '1'
    end
  end

  def extract_issue_num_from_gn_comixology
    self.title.slice(5..self.title.length)
  end

  def extract_issue_num_from_gn_google
    self.title.slice((self.title.index('Vol')+5)...(self.title.index(':')))
  end

  def google_make_for_sale(volume)
    issue = Volume.find(volume).issues.find_by(issue_number: self.extract_issue_number_from_title)
    if issue
      for_sale = issue.for_sale_comics.new(vendor_id: Vendor.find_by(name: 'Google Play Store').id)
      for_sale.price_in_cents = self.price_in_cents
      for_sale.url = self.url
      for_sale.save
    end
  end

  def google_make_gn_for_sale(volume)
    issue = Volume.find(volume).issues.find_by(issue_number: self.extract_issue_num_from_gn_google)
    if issue
      for_sale = issue.for_sale_comics.new(vendor_id: Vendor.find_by(name: 'Google Play Store').id)
      for_sale.price_in_cents = self.price_in_cents
      for_sale.url = self.url
      for_sale.save
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

  def comixology_make_gn_for_sale(volume)
    issue = Volume.find(volume).issues.find_by(issue_number: self.extract_issue_num_from_gn_comixology)
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
