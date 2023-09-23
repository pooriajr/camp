class StakeholderUpdateMailer < ApplicationMailer
  def monthly_report
    mail(to: 'pjrashidi@gmail.com', subject: "Stakeholder Update")
  end
end
