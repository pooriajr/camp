class StakeholderUpdateMailer < ApplicationMailer
  def monthly_report
    mail(to: Rails.application.credentials.emails, subject: "Camp Stakeholder Update")
  end
end
