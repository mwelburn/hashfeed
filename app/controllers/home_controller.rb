class HomeController < ApplicationController

  def index

  end

  def login

  end

  def search
    q = params[:q]

    if q.nil?
      redirect_to :action => 'error'
    end

    redirect_to :action => 'tag', :tag => q
  end

  def tag
    #TODO - Need to split up the tags to do an OR search
    @tag = params[:tag]

    #shouldn't hit this without going to error page, but just in case
    if @tag.nil?
      redirect_to :root
    end

    #get results
    result = Instagram.client.tag_recent_media(@tag, {:count => 30})

    @media = nil
    if !result.nil?
	    @media = result.data
    end
    #render :text => @media
  end

  #retrieve older tags
  def ajax_old
    max_id = params[:max_id]
    tag = params[:tag]

    #if bad parameters, just return nothing
    if max_id.nil? or tag.nil?
      return nil
    end

    result = Instagram.client.tag_recent_media(tag, {:max_id => max_id})

    if !result.nil?
      return result.data
    end

  end

  #retreive tags since last call
  def ajax_new
    min_id = params[:min_id]
    tag = params[:tag]

    #if bad parameters, just return nothing
    if min_id.nil? or tag.nil?
      return nil
    end

    result = Instagram.client.tag_recent_media(tag, {:count => 10, :min_id => min_id})

    if !result.nil?
      return result.data
    end

  end

end
