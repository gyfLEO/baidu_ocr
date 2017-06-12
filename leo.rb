###api call, (class) 
require 'open-uri'
require 'json'
require 'net/http'
require 'base64'

class Ocr
  
  def ocr_recog (filePath)
    uri = 'https://aip.baidubce.com/rest/2.0/ocr/v1/webimage?access_token=24.57752b00966caacd4b87f46ea7ae35e9.2592000.1499407188.282335-9737129'
    bodys = {}
    File.open(filePath.to_s, 'r') do |file|
      bodys['image'] = Base64.encode64(file.read)
    end
    bodys['image'].gsub!(/\n+/,'')
    @res = Net::HTTP.post_form(URI.parse(uri), bodys)
  end

  def deal
    p @res
    content = JSON.parse(@res.body)['words_result'].map do |each|
      if (each['words'] =~ /^((S|s)\/(N|n)|[\u3E00-\u9FA5]{2}:)/)
        each['words']
      end
    end
    content.compact!
  end
end

recog = Ocr.new
recog.ocr_recog('/tmp/3.jpg')
p recog.deal