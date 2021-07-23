class PagesController < ApplicationController
  def home
    @expertises = ["IT", "Media", "Sales", "Editing", "UX Design"]
    @all_consultants = []
    @all_mentees = []
    User.all.each do |user|
      if user.speciality.present?
        @all_consultants << user
      else
        @all_mentees << user
      end
    end
    @top_consultants = @all_consultants.sample(6)
    @consultations = Consultation.all.sample(6)
  end

  def dashboard
    @bookings = Booking.all
  end
end
