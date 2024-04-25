### Build lambda

    docker build -f Dockerfile.build -t awsruby32 .

    docker run --rm -it -v $PWD:/var/task -w /var/task awsruby32

    yum install -y mariadb-devel libyaml-devel

    bundle config --local build.mysql2 --with-mysql2-config=/usr/lib64/mysql/mysql_config

    bundle config set --local path 'vendor/bundle' && bundle install

    cp -a /usr/lib64/mysql/*.so.* /var/task/lib/

    zip -r lamb.zip app bin config config.ru db Gemfile Gemfile.lock lib public Rakefile storage tmp vendor

### Clean up

    sudo rm -rf .bundle/

### Start services

    docker compose up [-d]

### Deploy lambda

    TF_VAR_FLISOLFLICTS_GMAIL_PASSWORD=$FLISOLFLICTS_GMAIL_PASSWORD tflocal apply
