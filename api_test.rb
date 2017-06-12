###api call
require 'open-uri'
require 'json'
require 'net/http'
require 'base64'

uri = 'https://aip.baidubce.com/rest/2.0/ocr/v1/webimage?access_token=24.57752b00966caacd4b87f46ea7ae35e9.2592000.1499407188.282335-9737129'
bodys = {}

File.open('/tmp/3.jpg', 'r') do |file|
  bodys['image'] = Base64.encode64(file.read)
end

bodys['image'].gsub!(/\n+/,'')
res = Net::HTTP.post_form(URI.parse(uri), bodys)
content = JSON.parse(res.body)['words_result'].map do |each|
  if (each['words'] =~ /^((S|s)\/(N|n)|[\u3E00-\u9FA5]{2}:)/)
    each['words']
  end
end

p content.compact!