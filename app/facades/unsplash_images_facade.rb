class UnsplashImagesFacade
  def self.get_images(term)
    image_data = UnsplashService.get_images(term)
    image_data[:results].map do |img|
      Image.new(img)
    end
  end
end