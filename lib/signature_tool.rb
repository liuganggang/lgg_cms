#
# api签名工具
#
#
class SignatureTool

  attr_accessor :public_key, :private_key, :nonce, :params

  # tool = SignatureTool.new params: {a:1, b:2}, public_key: 'pub1', private_key: 'pri1', nonce: '12345'
  def initialize(options)
    self.public_key = options[:public_key]
    self.private_key = options[:private_key]
    self.nonce = options[:nonce]
    self.params = options[:params]
  end

  # 签名
  def signature
    str = params_to_string_format
    Digest::MD5.hexdigest(str + "&private_key=#{private_key}")
  end

  # 验签
  def verify_signature
    old_signature = params.delete(:signature)
    str = params_to_string_format
    new_signature = Digest::MD5.hexdigest(str + "&private_key=#{private_key}")
    new_signature == old_signature
  end

  private

  # 1.合并 public_key，nonce
  # 2.去掉 空值参数
  # 3.参数按照字母顺序排序
  # 4.把得到的内容整理成字符串 &相连 如： name=joy&age=30
  def params_to_string_format
   result = params.merge(public_key: public_key, nonce: nonce)
   result = result.select{ |key, value| value.present? } # 去掉 空值参数
   result = result.sort_by{|key, value| key}  # 按照字母顺序排序
   result = result.map{ |e| "#{e.first}=#{e.last}" }  # 把得到的内容整理成字符串
   result.join("&")
  end
end
