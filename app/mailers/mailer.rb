class Mailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.location.user.email,
      subject: "New Review for #{review.location.name_of_location}")
  end
end
