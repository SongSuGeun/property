class IconImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file # 保存形式の設定。他に使うものとしてはfog形式などがある。
  process :resize_to_limit => [200, 200] #画像サイズの調整
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
end