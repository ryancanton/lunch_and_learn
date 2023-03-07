class LearningResourcesFacade
  def self.get_resources(country)
    yt_video = YoutubeFacade.get_video(country)
    images = UnsplashImagesFacade.get_images(country)
    LearningResource.new(country, yt_video, images)
  end
end