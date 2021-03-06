html = Nokogiri.HTML(content)

#load products
products = html.css('.JIIxO ._3t7zg')
products.each do |product|
  url = URI.join('https://aliexpress.com', product['href']).to_s.split('?').first
  if product
    if url =~ /\Ahttps?:\/\//i
      pages << {
        url: url,
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

index = page["vars"]["page"]
all_page = html.css('.jump-aera .total-page')
total_page = all_page.empty? ?  60 : all_page.text.scan(/\d+/)[0].to_i
next_url = page["vars"]["base_url"] + "?page=#{index}" if index <= total_page
index += 1
if index <= total_page
  pages << {
    page_type: "listings",
    method: "GET",
    fetch_type: "browser",
    url: next_url,
    headers: {
      "User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
      "Sec-CH-UA" => "'Not A;Brand';v='99', 'Chromium';v='96', 'Google Chrome';v='96'"
    },
    vars: {
      category: "Women's clothing",
      "base_url" => "https://www.aliexpress.com/category/100003109/women-clothing.html",
      "page" => index
    },
    driver: {
      "code": "await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
      await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
      await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
      await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
      await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
      await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);"
    }
  }
end