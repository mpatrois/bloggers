class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! ,:except => [:index, :show]
  before_filter :require_permission ,:only => [ :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json

  

  def index
    @page=0
    @limit=5
    @numberPosts=Post.count
    @numberPage=1

    if(params[:page] && params[:page].is_number?)
      @page=params[:page].to_i > 0 ? params[:page].to_i : 1
      @page=@page-1
    end

    if(params[:limit] && params[:limit].is_number?)
      @limit = params[:limit].to_i > 0 ? params[:limit].to_i : 1

      if(@limit>@numberPosts && @numberPosts > 0)
        @limit = @numberPosts
      end
    end
    
    # puts @limit
    
    @mod=(@numberPosts % @limit ==0) ? 0 : 1
  
    if(@limit+@mod>0)
      @numberPage=@numberPosts/@limit+@mod
    end
    
    if(@page>@numberPage)
      @page=@numberPage-1
    end
    
    @offset=@limit*@page
    respond_to do |format|
      format.html{ @posts = Post.limit(@limit).offset(@offset) }
     
      format.json{ 
        render json: Post.limit(@limit).offset(@offset).to_json(:include => {
        :user => {:except => [:created_at, :updated_at]},
        :comments => {:only => [:id]}  })
      }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post= Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    post_params = params[:post]
    post_params = post_params.permit(:title,:header,:content,:file_name)
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    # @user_photo_name=params[:user_photo_name];

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post.user, notice: 'Post was successfully destroyed.' }
      format.json {
        render json: @post.id 
      }
      format.js {render json: @post, status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :header)
    end

    def require_permission
      if current_user != Post.find(params[:id]).user
        redirect_to post_path(params[:id])
      end
    end

end
