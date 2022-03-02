html = Nokogiri.HTML(content)

#load products
products = html.css('.JIIxO a._3t7zg._2f4Ho')
products.each do |product|
  a_element = product.at_css('a._3t7zg._2f4Ho')
  if a_element
    url = URI.join('https:', a_element['href']).to_s.split('?').first
    if url =~ /\Ahttps?:\/\//i
      pages << {
          url: url,
          _collection: "products",
          page_type: 'products',
          fetch_type: 'browser',
          force_fetch: true,
          vars: {
            category: page['vars']['category'],
            url: url
          }
        }
    end
  end
end

#load paginated links
pagination_links = html.css('.next-pagination-item')
pagination_links.each do |link|
  l_val = link.text.strip
  if l_val !~ /next|previous/i && l_val.to_i < 11 #limit pagination to 10 pages
    # url = URI.join('https:', link['href']).to_s.split('?').first
    pages << {
        # url: url,
        page_num: l_val,
        page_type: 'listings'
      }
  end
end