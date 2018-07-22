class MakeMailer < ApplicationMailer
    def make_email(user,picture)
        @user=user
        @picture=picture
        @url="http://localhost:3000/picture/#{@picture.id}/image_show"
        mail(to: @picture.sent_email, subject: "Timecapsuleが届きました")
    end
end
