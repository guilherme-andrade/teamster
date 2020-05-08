class Parcel < ApplicationRecord
  has_one_attached :barcode_attachment
  belongs_to :service_request

  after_validation :generate_barcode

  measured Measured::Weight, :weight
  measured Measured::Length, :length, :height, :width

  def generate_barcode
    barcode = SecureRandom.base64
    barby_code = Barby::Code128B.new(barcode)
    barby_image = Barby::PngOutputter.new(barby_code).to_png
    file_path = Rails.root.join('tmp', 'storage', "barcode.png")
    File.open(file_path, 'wb') { |f| f.write barby_image }
    barcode_attachment.attach(io: File.open(file_path), filename: "#{barcode}.png")
    File.delete(file_path) if File.exist?(file_path)
  end
end
