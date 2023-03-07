class LearningResourcesSerializer
  def self.format_resource(resource)
    {
      data: {
        id: 'null',
        type: 'learning_resource',
        attributes: {
          country: resource.country,
          video: {
            title: resource.video.title,
            youtube_video_id: resource.video.youtube_video_id
          },
          images: format_images(resource.images)
        }
      }
    }
  end

  def self.format_images(images)
    images.map do |image|
      {
        alt_tag: image.alt_tag,
        url: image.url
      }
    end
  end
end

