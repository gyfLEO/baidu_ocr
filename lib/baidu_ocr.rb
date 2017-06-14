###Baidu Ocr### 
require 'open-uri'
require 'json'
require 'net/http'
require 'base64'

class BaiduOcr
  def initialize(image_filepath, access_token)
    begin
      unless access_token.nil? or image_filepath.nil?
        uri = 'https://aip.baidubce.com/rest/2.0/ocr/v1/webimage?access_token=' + access_token
        body = {}
        File.open(image_filepath.to_s, 'r') { |file| body['image'] = Base64.encode64(file.read) }
        body['image'].gsub!(/\n+/,'')
        @res = Net::HTTP.post_form(URI.parse(uri), body)
      end
    rescue Exception => e
      puts e.message, e.backtrace.inspect
    end
  end

  def info_deal
    content = JSON.parse(@res.body)['words_result'].map do |each|
      if (each['words'] =~ /^((S|s)\/(N|n)|[\u3E00-\u9FA5]{2}:)/)
        each['words']
      end
    end
    content.compact!
  end
end
