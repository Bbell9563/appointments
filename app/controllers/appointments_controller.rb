class AppointmentsController < ApplicationController
  before_action :set_patients, only: [:edit, :update, :new, :create]
  before_action :set_doctors, only: [:edit, :update, :new, :create]

  before_action :set_appointment, only: [:show]


  def show
    @patient = Patient.find(@appointment.patient_id)
    @doctor = Doctor.find(@appointment.doctor_id)
  end

  def new
    @appointment = Appointment.new 
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save 
      redirect_to appointments_path
    else  
      render :new
    end
  end
  def index
    @appointments = Appointment.all 
  end

  def edit
  end

  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :time, :date)
  end
  def set_patients
    @patients = Patient.all
  end

  def set_doctors
    @doctors = Doctor.all
  end

  # def set_doctors
  #   @doctor = Doctor.find(params[:doctor_id])
  # end

  # def set_patients
  #   @patient = Patient.find(params[:patient_id])
  # end
end
