class UploadCsvsController < ApplicationController
  before_action :set_upload_csv, only: [:show, :edit, :update, :destroy]
  require 'csv'
  require 'httparty'
  require 'nokogiri'
  # GET /upload_csvs
  # GET /upload_csvs.json
  def index
    @upload_csvs = UploadCsv.all.paginate(page: params[:page], per_page: 5)
  end

  # GET /upload_csvs/1
  # GET /upload_csvs/1.json
  def show
  end

  # GET /upload_csvs/new
  def new
    @upload_csv = UploadCsv.new
  end

  # GET /upload_csvs/1/edit
  def edit
  end

  # POST /upload_csvs
  # POST /upload_csvs.json
  def create
    @upload_csv = UploadCsv.new(upload_csv_params)
    respond_to do |format|
      if @upload_csv.save
        format.html { redirect_to @upload_csv, notice: 'Uploaded csv, we will let you know once that is processed and email will be deliver.' }
        format.json { render :show, status: :created, location: @upload_csv }
      else
        format.html { render :new }
        format.json { render json: @upload_csv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_csvs/1
  # PATCH/PUT /upload_csvs/1.json
  def update
    respond_to do |format|
      if @upload_csv.update(upload_csv_params)
        format.html { redirect_to @upload_csv, notice: 'Upload csv was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_csv }
      else
        format.html { render :edit }
        format.json { render json: @upload_csv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_csvs/1
  # DELETE /upload_csvs/1.json
  def destroy
    @upload_csv.destroy
    respond_to do |format|
      format.html { redirect_to upload_csvs_url, notice: 'Upload csv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_csv
      @upload_csv = UploadCsv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_csv_params
      params.require(:upload_csv).permit(:csv_file, :generated_csv, users: [])
    end
  end
