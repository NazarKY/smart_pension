# Git Log Parser

This project is a Ruby-based tool that parses web server logs and provides insights into the most viewed pages and unique visitors. The project is structured with a focus on clean code, adhering to SOLID principles, and is fully tested with RSpec.

## Features

- **Log Parsing**: Reads and parses web server logs, creating structured data from raw log entries.
- **Page Views Calculation**: Calculates and displays the total number of views for each page.
- **Unique Views Calculation**: Calculates and displays the number of unique views for each page based on IP addresses.
- **Customizable Displayers**: Outputs data in a tabular format, providing a clear view of the results.

## Entities

### 1. `PageView`

A simple `Struct` that represents a single page view entry with two attributes:

- `page`: The URL of the page viewed.
- `ip`: The IP address of the user who viewed the page.

### 2. `LogParser`

The `LogParser` class reads a log file and parses it into an array of `PageView` structs. It handles the extraction of page URLs and IP addresses from each log entry.

### 3. `Displayers::Base`

An abstract base class for all display strategies. It provides a common interface for displaying data in a table format. The `Base` class requires subclasses to implement the `header` and `data` methods.

### 4. `Displayers::PageViews`

A subclass of `Displayers::Base`, responsible for calculating and displaying the total number of views for each page. It sorts the pages by the number of views in descending order.

### 5. `Displayers::UniqueViews`

A subclass of `Displayers::Base`, responsible for calculating and displaying the number of unique views for each page. It identifies unique views by tracking unique IP addresses for each page and sorts the results in descending order.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/smart_pension.git
   cd smart_pension
   ```


## Usage

1. Run the log parser:
   ```bash
   ruby main.rb webserver.log
   ```
2. The output will display the most viewed pages and the pages with the most unique views in a table format.


## Running Tests:
   ```bash
   bundle exec rspec
   ```
