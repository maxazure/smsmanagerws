class WebserviceController < ApplicationController
  def getphone
    @appointment = Appointment.where(flag: 0).first
    if @appointment.nil? then
      render plain: "{}"
    elsif @appointment.appointment_when.nil? or @appointment.appointment_date.nil?
      @appointment.flag = 1
      @appointment.save
      render plain: "{}"
   else

    @message_body = @appointment.template.body.gsub("{me}",@appointment.user.fullname)
    @message_body = @message_body.gsub("{my phone number}",@appointment.user.telnumber)

  #  @appointment.fullname ="" if @appointment.fullname.nil?

    @message_body = @message_body.gsub("{firstname}",@appointment.fullname)

    @message_body = @message_body.gsub("{When}",@appointment.appointment_when)
    @message_body = @message_body.gsub("{Date}",@appointment.appointment_date)

#    @appointment.flag = 2
#    @appointment.save
   end
    render plain: "{111}"
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
