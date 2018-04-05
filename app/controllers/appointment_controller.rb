
class AppointmentController < ApplicationController
  def index
  end

  def report
    @appointment = Appointment.order(id: :desc).limit(50)
  end


  def upload
    uploaded_io = params[:phonedata]
    filename = Rails.root.join('public', 'uploads', getFileNameByTime())

    addPhoneRecords uploaded_io.read.split("\n")

    render plain: "ok"
  end

  def addPhoneRecords(records)
    str=""
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
      apt.template_id = 1
      apt.user_id = 1
      apt.company_id = 1
      apt.flag = 0
      apt.save
    end
  end

  def getFileNameByTime
    Time.now.strftime("%Y%m%d%H%M%S")
  end
end
