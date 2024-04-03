#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
# bundle exec rake db:migrate # データベースを作成?

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 # 本番環境のデーターベースを削除可能に
bundle exec rake db:migrate:reset # データーベースを削除