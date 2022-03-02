product = {}

product['url'] = page['vars']['url']

product['category'] = page['vars']['category']

product['title'] = nokogiri.at_css('.product-title-text').text.strip

product['_collection'] = "products"

outputs << product