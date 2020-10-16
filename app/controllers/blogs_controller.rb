class BlogsController < ApplicationController

  before_action :set_blog, only: [:update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
        respond_to do |format|
        if @blog.save
            #format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
            format.html { redirect_to blogs_path, notice: 'Blog was successfully created.' }
        else
            format.html { render :new }
        end
    end
    #if @blog.save
    #    render :show, status: :created, location: @blog
    #else
    #    render :new
    #end
  end

  def update
    if @blog.update(blog_params)
        render :show, status: :ok, location: @blog
    else
        render :edit
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
        format.html { redirect_to blogs_url, notice: '削除されました' }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
    #@blog = Blog.where("id = #{params[:id]}").first
  end

  def blog_params
    params.require(:blog).permit(:title)
  end
end
