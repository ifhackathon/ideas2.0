# encoding: utf-8

class ProjectImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :convert => 'jpg'


  process :resize_to_limit => [2000, 1000]
  process :convert => 'jpg'

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [500, nil]
  end
  #
  # version :title do
  #   process :resize_to_limit => [385, nil]
  # end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.jpg"
    end
  end

end
