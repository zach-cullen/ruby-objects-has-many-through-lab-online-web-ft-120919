class Patient
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointment.all.select {|appt| appt.patient == self}
  end
  
  def doctors
    doctor_list = self.appointments.collect {|appt| appt.doctor}
    doctor_list.uniq
  end
  
  def self.all
    @@all
  end
end