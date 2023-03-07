class Video
  attr_reader :youtube_video_id,
              :title

  def initialize(data)
    @youtube_video_id = data[:id][:videoId]
    @title = data[:snippet][:title]
  end
end