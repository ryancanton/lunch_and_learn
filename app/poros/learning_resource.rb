class LearningResource
  attr_reader :country, 
              :video,
              :images

  def initialize(country, vid, imgs)
    @country = country
    @video = vid
    @images = imgs
  end
end