class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]

  def index
    # @consultations = Consultation.all
    @consultations = policy_scope(Consultation)
  end
  
  def show
  end

  def new
    @consultation = Consultation.new
    authorize @consultation
  end


  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    authorize @consultation
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
    authorize @consultation
  end

end
