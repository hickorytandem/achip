class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]

  def index
  end

  def show
  end

  private

  def find_consultation
    @consultation = Consultation.find(params[:id])
  end

end
