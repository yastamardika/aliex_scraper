pages << {
    page_type: "listings",
    method: "GET",
    fetch_type: "browser",
    url: "https://www.aliexpress.com/category/100003109/women-clothing.html?page=1",
    headers: {
      "User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
      "Sec-CH-UA" => "'Not A;Brand';v='99', 'Chromium';v='96', 'Google Chrome';v='96'"
    },
    vars: {
      category: "Women's clothing",
      "base_url" => "https://www.aliexpress.com/category/100003109/women-clothing.html",
      "page" => 2
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