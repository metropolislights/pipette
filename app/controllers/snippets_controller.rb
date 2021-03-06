class SnippetsController < ApplicationController

  before_action :set_snippet, :only => [:show, :edit, :update, :destroy]

  def index
    @snippets = Snippet.all.order("created_at DESC")
  end

  def show
    @comment = @snippet.comments.build
    @comments = @snippet.comments.all
  end

  def new
    @snippet = current_user.snippets.build
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    @snippet.update(params[:snippet])
    redirect_to :action => "index"
  end

  def destroy
    @snippet.destroy
    redirect_to :action => "index"
  end

  private

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params.require(:snippet).permit(:title, :content)
  end

end
