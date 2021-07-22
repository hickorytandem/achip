class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @consultations = policy_scope(Consultation.all)
  end

  def new
    @consultation = Consultation.new
  end

  def show
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
