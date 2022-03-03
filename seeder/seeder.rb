pages << {
    page_type: "listings",
    method: "GET",
    fetch_type: "browser",
    url: "https://www.aliexpress.com/category/100003109/women-clothing.html?page=1",
    headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
    vars: {
      category: "Women's clothing"
    },
    driver: {
      "code": "await page.evaluate('window.scrollBy(0,3600)'); await sleep(1000);"
    }
  }