# coding: utf-8
class ApplicationMailer < ActionMailer::Base
  add_template_helper(PositionApplicationsHelper)
  default from: "admin@halloped.fi"

  def sent_email(application)
    @application = application
    mail(:to => application.user.email, :subject => "Hakemuksesi on vastaanotettu. Vi har mottagit din ansökan. Your application has been received.")
  end

  def pair_notification(submitted_application, university, email)
    @partner_application = submitted_application
    @call = submitted_application.call
    @university = university
    mail(:to => email, :subject => "Halloped-ilmoitus/ Meddelande från Halloped/ Halloped notification") do |format|
      if submitted_application.member.nil? && submitted_application.deputy.nil?
        render "reminder_to_send_application"
      else
        render "notification_of_pair_application"
      end
    end
  end

  class EmailNotificationJob
    include SuckerPunch::Job

    def perform(partner_id, university_id, email)
      a = ::PositionApplication.find(partner_id)
      u = ::Organization.find(university_id)
      ::ApplicationMailer.pair_notification(a, u, email).deliver
    end
  end

end
