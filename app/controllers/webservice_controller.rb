class WebserviceController < ApplicationController
  def getphone
    @appointment = Appointment.where(flag: 0).first
    if !@appointment.nil? then
    @message_body = @appointment.template.body.gsub("{me}",@appointment.user.fullname)
    @message_body = @message_body.gsub("{my phone number}",@appointment.user.telnumber)
    @message_body = @message_body.gsub("{firstname}",@appointment.fullname)
    @message_body = @message_body.gsub("{When}",@appointment.appointment_when)
    @message_body = @message_body.gsub("{Date}",@appointment.appointment_date)

    @appointment.flag = 2
    @appointment.save
  else
    render plain: "{}"
  end

  end

  def report
    @appointment = Appointment.find(params[:id])
    if !@appointment.nil? then

      @appointment.flag = 1
      @appointment.sent_time = Time.now
      @appointment.save
    end

    render plain: "ok"
  end
end
