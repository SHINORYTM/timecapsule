class MakeMailer < ApplicationMailer
    def make_email(user,picture)
        @user=user
        @picture=picture
        
        
        mail(to: @picture.sent_email, subject: "Timecapsuleが届きました")
    end
end
