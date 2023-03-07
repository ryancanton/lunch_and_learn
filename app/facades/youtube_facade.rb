class YoutubeFacade
  def self.get_video(country)
    video_info = YoutubeService.get_country_video(country)
    Video.new(video_info[:items][0])
  end
end