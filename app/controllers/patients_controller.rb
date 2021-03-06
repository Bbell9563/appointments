class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :edit, :destroy]
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
    render partial: 'patient'
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path

    else  
      render :new
    end
  end

  def edit
    render partial: 'patient'
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)

    else
      render :edit  
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :gender)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
