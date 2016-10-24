Bbs.configure do |config|
  # clamp line specified words.
  # for example, if you set `config.clamp_article_body` to `10`,
  # comment or topics body will clamp 10 words when user does not logged in.
  #
  # If you set value `false`, never clamp line.
  config.clamp_article_body = 10

  # spedify sign in path
  config.login_path = '/users/sign_in'
end
