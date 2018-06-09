
# Build process #
# docker build -t ft-rails .

FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y nodejs && gem install rails && gem install bundler

ONBUILD COPY . /opt/app
ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle install --jobs 20 --retry 5
ONBUILD EXPOSE 3000
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

#ctive Record tracks which migrations have already been run so all you have to do is update your source and run rake db:migrate. Active Record will work out which migrations should be run. It will also update your db/schema.rb file to match the structure of your database. http://guides.rubyonrails.org/v3.2/migrations.html

# The --jobs option (-j for short) installs gems in parallel. For example, bundle install -j4 will use 4 workers. We've seen speedups of 40-60% on fresh bundle installs. To always install in parallel, run bundle config --global jobs 4 or set BUNDLE_JOBS. https://bundler.io/v1.5/whats_new.html 


#The ONBUILD instruction adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the FROM instruction in the downstream Dockerfile.

# Any build instruction can be registered as a trigger.

# This is useful if you are building an image which will be used as a base to build other images, for example an application build environment or a daemon which may be customized with user-specific configuration.
