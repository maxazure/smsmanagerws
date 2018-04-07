
class AppointmentController < ApplicationController
  before_action :require_login
  def index
  end

  def report
    @appointment = current_user.appointments.where(flag: 0).order(id: :desc).limit(650)
  end


  def upload
    uploaded_io = params[:phonedata]
    filename = Rails.root.join('public', 'uploads', getFileNameByTime())

    record = addPhoneRecords uploaded_io.read.split("\n")
    @info ="#{record} records has been uploaded successfully!"

  end

  def addPhoneRecords(records)
    str=""
    i=0
    records.each do |record|
      next if record.gsub(/\s+/,'').gsub(/;/,'').empty? or record.include? ";;"
      msg = record.gsub(/\r/,'').split ";"

      phone_num = msg[1].gsub(/\s+/,'').gsub(/\A64/,'')
      phone_num = "0" + phone_num if phone_num[0,1] != 0

      apt = Appointment.new
      apt.fullname = msg[0]
      apt.phone = phone_num
      apt.appointment_date = msg[3]
      apt.appointment_when = msg[2]
      apt.template_id = current_user.company.templates.first.id
      apt.user_id = current_user.id
      apt.company_id = current_user.company_id
      apt.flag = 0
      apt.save
      i=i+1
    end
    return i
  end

  def getFileNameByTime
    Time.now.strftime("%Y%m%d%H%M%S")
  end
end
