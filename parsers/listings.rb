html = Nokogiri.HTML(content)

#load products
products = html.css('.JIIxO ._3t7zg')
# p products
products.each do |product|
  # a_element = product.at_css('a._3t7zg')
  url = URI.join('https://aliexpress.com', product['href']).to_s.split('?').first
  if product
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
pagination_links = html.css('.next-pagination-list')
p pagination_links
# pagination_links.each do |link|
#   p link
#   l_val = link.text.strip
#   if l_val !~ /next|previous/i && l_val.to_i < 11 #limit pagination to 10 pages
#     url = URI.join('https:', link['href']).to_s.split('?').first
#     pages << {
#         url: url,
#         page_num: l_val,
#         page_type: 'listings',
#         fetch_type: 'browser',
#       }
#   end
# end