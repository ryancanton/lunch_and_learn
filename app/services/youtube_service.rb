class YoutubeService
  def self.get_country_video(country)
    chnl_id = 'UCluQ5yInbeAkkeCndNnUhpw'
    url = "https://www.googleapis.com/youtube/v3/search?key=#{ENV['yt_key']}&channelId=#{chnl_id}&part=snippet,id&q=#{country}&maxResults=1"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end