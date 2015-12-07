##Bloccitoff
To-do lists are notorious for collecting junk: things that you want to remember, but aren't important enough to do any time soon.

Bloccitoff aims to keep to-do lists manageable and clutter-free by automatically deleting to-do items that haven't been completed after seven days. The hypothesis is that if the to-do item doesn't get done in seven days, it doesn't belong in your face.

Made with my mentor at [Bloc](http://bloc.io).

###Automatic item deletion
In development, Bloccitoff relies on the [whenever](https://github.com/javan/whenever) gem to deploy the cron job that deletes old items (it executes at the top of every hour).

In production, Bloccitoff relies on Heroku's trusty [Scheduler](https://devcenter.heroku.com/articles/scheduler).

###Tracking by Blocmetrics
Bloccitoff also includes some code that enables event tracking (in development) by [Blocmetrics](https://github.com/eirinikos/blocmetrics). [These lines](https://github.com/eirinikos/bloccitoff/blob/master/app/views/layouts/application.html.erb#L18-L35) enable tracking the number of page views, button clicks, nav tab clicks, item deletion clicks, and overall link clicks.