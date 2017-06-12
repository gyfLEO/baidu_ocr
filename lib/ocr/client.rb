require 'rubygems'
require 'json'
require 'net/http'
require 'uri'
require 'base64'

class Client

  def initialize(token, image)
    base_url = self.class.const_get :BASE_URL
    uri = base_url + '?access_token=' + token.to_s
    bodys = {}
    File.open(image.to_s, 'r') { |file| bodys['image'] = Base64.encode64(file.read)}
    bodys['image'].gsub!(/\n+/,'')
    @res = Net::HTTP.post_form(URI.parse(uri), bodys)
  end

  def ocr_deal
    content = JSON.parse(@res.body)['words_result'].map do |each|
      if (each['words'] =~ /^((S|s)\/(N|n)|[\u3E00-\u9FA5]{2}:)/)
        each['words']
      end
  end
    content.compact!
  end

end