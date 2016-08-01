class LinksController < ApplicationController
  before_action :authenticate_admin!
  def index
    @links = Link.all(
      user_id: params['user_id'],
      slug: params['slug'],
      target_url: params['target_url']
    )
    render 'index.html.erb'
  end

  def new
    @link = Link.new
    render 'new.html.erb'
  end

  def create
    @link = Link.new(
      user_id: params['user_id'],
      slug: params['slug'],
      target_url: params['target_url']
    )
    redirect_to '/index'
  end

  def show
    @link = Link.find_by(slug: params['slug'])
    render 'show.html.erb'
  end

  def edit
    @link = Link.find_by(slug: params['slug'])
    render 'edit.html.erb'
  end

  def destroy
    @link = Link.find_by(slug: params['slug'])
    @link.destroy
    redirect_to '/index'
  end

  def update
    @link = Link.find_by(slug: params['slug'])
    @link.update(
      user_id: params['user_id'],
      slug: params['slug'],
      target_url: params['target_url']
    )
    flash[:success] = "Link successfully updated!"
    redirect_to "/index"
  end
end
