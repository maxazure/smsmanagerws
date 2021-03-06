class AppointmentController < ApplicationController
  before_action :require_login
  def index
  end

  def report


    @appointment = current_user.appointments.where(flag: 0).order(id: :desc).limit(650)
  end

  def delmsg
    # 删除所有的记录
    # 所有记录指的是 未发送的信息
      Appointment.where(flag: 0).delete_all
      
      redirect_to "/appointment/report"
  end


  def upload
    uploaded_io = params[:phonedata]
    filename = Rails.root.join('public', 'uploads', getFileNameByTime())


    record = addPhoneRecords uploaded_io.read#.split("\n")
    @info ="#{record} records has been uploaded successfully!"

  end

  def addPhoneRecords(records)
    str=""
    i=0
    csv = CSV.parse(records)

    csv.each do |msg|
      next if msg[0].nil? && msg[1].nil?
      next if msg[1].nil?


      phone_num = msg[1].gsub(/\s+/,'').gsub(/\A[0,\+]64/,'').gsub(/\A0064/,'').gsub(/\A64/,'')
      phone_num = "0" + phone_num if phone_num[0,1] != "0"

      next if /\d{6,15}/.match(phone_num).nil?

      phone_num = /\d{6,15}/.match(phone_num)[0]

      apt = Appointment.new
      apt.fullname = msg[0]
      apt.phone = phone_num

      apt.appointment_date = msg[3] unless msg[3].nil?
      apt.appointment_when = msg[2] unless msg[2].nil?
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
