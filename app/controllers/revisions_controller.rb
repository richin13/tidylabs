class RevisionsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :find_revision, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    respond_to do |format|
      format.html { @revisions = Revision.all }
      format.json { @revisions = Revision.where(open: true) }
    end
  end

  def show
  end

  def new
    @revision = Revision.new
  end

  def edit
  end

  def create
    @revision = Revision.new(revision_params)

    respond_to do |format|
      if @revision.save
        format.html { redirect_to @revision, notice: 'Revision creada satisfactoriamente' }
        format.json { render :show, status: :created, location: @revision }
      else
        format.html { render :new }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @revision.update(revision_params)
        format.html { redirect_to @revision, notice: 'Revision actualizada correctamente' }
        format.json { render :show, status: :ok, location: @revision }
      else
        format.html { render :edit }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @revision.destroy
    respond_to do |format|
      format.html { redirect_to revisions_url, notice: 'Revision fue borrada correctamente' }
      format.json { head :no_content }
    end
  end

  private

    def find_revision
      @revision = Revision.find(params[:id])
    end

    def revision_params
      params.require(:revision).permit(:name, :description, :open)
    end
end
