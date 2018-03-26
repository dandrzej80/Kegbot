# Kegbot local settings.
# Auto-generated by /home/kegbot/kegbot-server.venv/bin/setup-kegbot.py version 1.2.3.
# Safe to edit by hand. See http://kegbot.org/docs/server/ for more info.

# NEVER set DEBUG to `True` in production.
DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {'default': {'ENGINE': 'django.db.backends.mysql', 'NAME': 'kegbot', 'HOST': '', 'USER': 'root', 'PASSWORD': '', 'OPTIONS': {'init_command': 'SET storage_engine=INNODB'}}}

KEGBOT_ROOT = '/home/kegbot/kegbot-data'

MEDIA_ROOT = '/home/kegbot/kegbot-data/media'

STATIC_ROOT = '/home/kegbot/kegbot-data/static'

SECRET_KEY = 'tu&o2wwdax!30gq2_^y9t#s#+7d*g1568inhh+a&fp-e%3#hf8'
