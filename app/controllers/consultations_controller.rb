class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]

  def index
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
  end

  def show
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params) 
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:title, :description, :price, :duration)
  end

  def find_consultation
    @consultation = Consultation.find(params[:id])
  end

end
