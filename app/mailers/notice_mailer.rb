class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  default from: 'no-replay@gmail.com'

  def sendmail_confirm(blog, entry,comment)
    @blog = blog
    @entry = entry
    @comment = comment
    #@url = "http://192.168.33.10:3000/blog/#{@blog.id}/entry/#{@entry.id}"
    @url = "http://#{default_url_options[:host]}/blog/#{@blog.id}/entry/#{@entry.id}"

    mail(
        to: "tanakak@star.ocn.ne.jp",
        subject: "テストメール"
    )
  end
end
