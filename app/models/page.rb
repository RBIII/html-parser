class Page < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def parse_and_index
    html = open(self.url, &:read)
    noko_doc = Nokogiri::HTML(html)
    noko_doc.css('h1, h2, h3, a').each do |tag|
      if tag.name == "h1"
        self.h1s << tag.children.text
      elsif tag.name == "h2"
        self.h2s << tag.children.text
      elsif tag.name == "h3"
        self.h3s << tag.children.text
      else
        self.links << tag.attributes["href"].value unless tag.attributes["href"].nil?
      end
    end
  end
end
