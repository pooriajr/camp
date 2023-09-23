# Preview all emails at http://localhost:3000/rails/mailers/stakeholder_update_mailer
class StakeholderUpdateMailerPreview < ActionMailer::Preview

  def monthly_report
    StakeholderUpdateMailer.monthly_report
  end
end
