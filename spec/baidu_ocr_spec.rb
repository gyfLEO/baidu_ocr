require 'set'
require 'baidu_ocr'

describe BaiduOcr do
  let(:req) { BaiduOcr.new 'IMAGE_PATH', 'ACCESS_TOKEN' }
  it 'get info of the nameplate' do
    info = req.info_deal
  end
end