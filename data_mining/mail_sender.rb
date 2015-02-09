require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('smtp.seznam.cz', 25, 'seznam', 'xerne@seznam.cz', 'ernicek', 'plain') do |smtp|
  smtp.send_message message, 'xerne@seznam.cz',
                    'josef.erneker@gmail.com'
end