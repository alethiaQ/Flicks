module ApplicationHelper
  def youtube_video(preview)
    render :partial => "movies/video", :locals => { :preview => preview }
  end
end
