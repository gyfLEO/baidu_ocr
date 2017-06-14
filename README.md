# BaiduOcr

A Ruby interface to the BaiduOcr API.

## Supported Ruby Versions

This sdk has been tested against the following Ruby versions:

- 2.0.0 and upper

## Installation

```bash
gem build baidu_ocr.gemspec
sudo gem install *.gem
```

## Get Started
```ruby
require 'baidu-ocr'
req = BaiduOcr.new '/tmp/0.jpg', 'YOUR_ACCESS_TOKEN'
puts req.info_deal
```
~~See the RSpec tests for more examples.~~