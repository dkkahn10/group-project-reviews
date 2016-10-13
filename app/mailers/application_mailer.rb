# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'OUR EMAIL'
  layout 'mailer'
end
