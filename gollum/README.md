# Dockerized gollum wiki

Everything you need to run your own [gollum](https://github.com/gollum/gollum) wiki. 

    make build
    make run

The container will use a Git repository on the *host*, mounted via `-v` in the `run` target of the `Makefile`. To set the repo path (defaults to `$HOME/src/gollum`), run:

    make REPODIR=/tmp/another-repo.git run

## Integrate with Apache

Put the following in your Apache config to create a [VirtualHost](https://httpd.apache.org/docs/current/vhosts/examples.html).

    # Gollum
    <VirtualHost *:443>
      ServerName wiki.example.com:443
      ProxyPass           / http://localhost:4567/
      ProxyPassReverse    / http://localhost:4567/
    </Location>

## Caveats

* Take care that your REPODIR is owned by 1000:1000.
