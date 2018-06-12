class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]
  before_action :set_category
  before_action :authenticate_user!, except: [:index, :show]
  before_action :posting_owner, only: [:edit, :update, :destroy]

  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
  end

  # GET /postings/new
  def new
    @posting = current_user.postings.build
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings
  # POST /postings.json
  def create
    @posting = current_user.postings.build(posting_params)

    respond_to do |format|
      if @posting.save
        format.html { redirect_to @posting, notice: 'Posting was successfully created.' }
        format.json { render :show, status: :created, location: @posting }
      else
        format.html { render :new }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to @posting, notice: 'Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting }
      else
        format.html { render :edit }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
      format.html { redirect_to postings_url, notice: 'Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = Posting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posting_params
      params.require(:posting).permit(:title, :body, :user_id, :category_id)
    end

    def set_category
      @categories = Category.all 
    end

    def posting_owner
      unless @posting.user_id == current_user.id
       flash[:notice] = 'Access denied as you are not owner of this Posting'
       redirect_to root_path
      end
    end
end
