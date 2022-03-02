pages << {
    page_type: "listings",
    method: "GET",
    fetch_type: "browser",
    url: "https://www.aliexpress.com/category/100003109/women-clothing.html",
    vars: {
      category: "Women's clothing"
    },
    driver: {
      "code": "await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);"
    }
  }