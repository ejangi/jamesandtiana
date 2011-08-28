Jamesandtiana::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[jamesandtiana.com] ",
  :sender_address => %{"Exception Notifier" <root@ejangi.com>},
  :exception_recipients => %w{james@ejangi.com}