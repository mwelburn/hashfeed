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

    #get results
    result = Instagram.client.tag_recent_media(@tag, {:count => 100})

    @media = nil
    if !result.nil?
	    @media = result.data
    end
    #render :text => @media
  end

end
