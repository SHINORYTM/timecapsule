class MakeMailer < ApplicationMailer
    def confirm_mail(user,picture)
        @user=user
        @picture=picture 
        mail(to: @user.email, subject: "【確認メール】Timecapsuleを送信しました")
    end

    def create_account(user)
        @user=user
        mail(to: @user.email, subject: "Timecapsuleへの登録が完了しました")
    end

    def update_account(user)
        @user=user
        mail(to: @user.email, subject: "Timecapsuleのアカウントを編集しました")
    end

    def send_the_work(picture)
        @picture=picture
        @user = User.find_by(id: picture.user_id) 
        mail(to: @picture.sent_email, subject: "Timecapsuleが届きました")
    end

    def send_the_album(album)
        @album=album
        @user = User.find_by(id: album.user_id) 
        mail(to: @album.target_for, subject: "Timecapsuleが届きました")
    end

    def confirm_email(user,album)
        @user=user
        @album=album 
        mail(to: @user.email, subject: "【確認メール】Timecapsuleを送信しました")
    end
end
