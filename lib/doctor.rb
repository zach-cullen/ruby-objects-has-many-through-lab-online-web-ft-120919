class Doctor
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def appointments
    Appointment.all.select {|appt| appt.doctor == self}
  end
  
  def new_appointment(patient, date)
    appt = Appointment.new(date, patient, self)
  end
  
  def patients
    patient_list = self.appointments.collect {|appt| appt.patient}
    patient_list.uniq
  end
  
  def self.all
    @@all
  end
end