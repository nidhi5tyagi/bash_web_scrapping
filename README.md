# bash_web_scrapping


# **Laptop Scraper Script**

A Bash script to scrape laptop details (price, name, and description) from a html file and format the data into a readable output.

---

## **Overview**

This script reads an txt file (`laptops.html`) containing product details for laptops. It extracts the following fields for each laptop:
- **Price**
- **Product Name**
- **Description**

The extracted data is formatted into the following structure and saved in `output8.txt`:
```
Product Name | Description | Price
```

---

## **Features**

- Parses an HTML file line by line.
- Extracts key details using `sed` commands.
- Formats the output into a structured, human-readable file.
- Resets data after processing three key fields (price, name, description) for each laptop.

---

## **Requirements**

- **Bash Shell**: Ensure you have a Linux or macOS terminal or Git Bash on Windows.
- **HTML Input**: The script processes an HTML file named `laptops.html`.

---

## **How to Use**

### **1. Prepare Your Environment**

1. Make sure the `laptops.html` file is in the same directory as the script. This file should contain the HTML structure of the page you're scraping, such as:
   ```html
   <div class="card thumbnail">
       <h4 class="price">$306.99</h4>
       <a href="/test-sites/e-commerce/allinone/product/32" class="title" title="Aspire E1-510">Aspire E1-510</a>
       <p class="description card-text">15.6", Pentium N3520 2.16GHz, 4GB, 500GB, Linux</p>
   </div>
   ```

2. Ensure the script has execution permissions:
   ```bash
   chmod +x scrap_laptops.sh
   ```

---

### **2. Run the Script**

Run the script in your terminal:
```bash
./scrap_laptops.sh
```

This will create or overwrite the `output8.txt` file with the scraped data.

---

### **3. Output**

The extracted data will be stored in `output.txt` in the format:
```
Aspire E1-510 | 15.6", Pentium N3520 2.16GHz, 4GB, 500GB, Linux | $306.99

```

---

## **How the Script Works**

1. **File Reading**:
   - Reads `laptops.html` line by line.

2. **Field Extraction**:
   - **Price**: Extracted using `sed`:
     ```bash
     sed -n 's/.*<h4 class="price.*>\(.*\)<\/h4>.*/\1/p'
     ```
   - **Name**: Extracted using `sed`:
     ```bash
     sed -n 's/.*<a href=".*" class="title" title="\(.*\)">.*/\1/p'
     ```
   - **Description**: Extracted using `sed`:
     ```bash
     sed -n 's/.*<p class="description card-text">\([^<]*\)<\/p>.*/\1/p'
     ```

3. **Data Formatting**:
   - Combines `name`, `description`, and `price` into one line with `|` as the separator:
     ```bash
     echo "${laptop[1]} | ${laptop[2]} | ${laptop[0]}" >> output8.txt
     ```

4. **Resetting**:
   - After processing one product, the script resets the `laptop` array and counters for the next product.

---

## **Customizations**

1. **Change the Input File**:
   
     ```bash
     cat laptops.txt | ...
     ```

2. **Modify the Output File**:
     ```bash
     echo "${laptop[1]} | ${laptop[2]} | ${laptop[0]}" >> output_file.txt
     ```

3. **Extract Additional Fields**:
   - Extend the `sed` commands to extract other HTML elements, if needed.

---

## **Limitations**

- Works only for static HTML. For dynamically loaded content (e.g., JavaScript), use a browser automation tool like Selenium or Puppeteer.
- Assumes consistent HTML formatting. Changes in the HTML structure might break the script.

---

## **Future Improvements**

- Add support for dynamic content using tools like `curl` and `headless browsers`.
- Handle inconsistent HTML formatting with fallback logic.
- Allow dynamic input and output file names via command-line arguments.


