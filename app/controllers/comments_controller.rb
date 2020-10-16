class CommentsController < ApplicationController
  
  def search1
  end

  def search2
    com = Comment.find(params[:id])
    com.status = "approved"
    com.save
    @comment = Comment.find(params[:id])
    redirect_to blog_entry_comments_path

    @entry = Entry.find(params[:entry_id])
    @blog = Blog.find(params[:blog_id])
    
    NoticeMailer.sendmail_confirm(@blog, @entry, @comment).deliver
  end

  def index
    @comments = Entry.joins(:comments).merge(Comment.where(entry_id: params[:entry_id])).select("comments.*")
    @entry = Entry.find(params[:entry_id])
    @blog = Blog.find(params[:blog_id])
  end

  def show
  end

  def edit
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(create_params)
      if @comment.save
        redirect_to blog_entry_comments_path, notice: 'Comment was successfully created.'
      else
        render :new
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_comments_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_params
    params.require(:comment).permit(:body, :status).merge(entry_id: params[:entry_id])
  end
end
