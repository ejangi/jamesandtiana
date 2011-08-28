Jamesandtiana::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[jamesandtiana.com] ",
  :sender_address => %{"James & Tiana" <mrandmrs@jamesandtiana.com>},
  :exception_recipients => %w{james@ejangi.com}