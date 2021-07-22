class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @consultations = policy_scope(Consultation.all)
  end

  def show
    authorize @consultation
  end

  private

  def find_consultation
    @consultation = Consultation.find(params[:id])
  end

end
