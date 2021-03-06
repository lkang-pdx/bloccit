class FavoriteMailer < ApplicationMailer
  default from: "luna.kang.ca@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@afternoon-crag-43986.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@afternoon-crag-43986.example>"
    headers["References"] = "<post/#{post.id}@afternoon-crag-43986.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
