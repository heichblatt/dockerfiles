# Jekyll

## Usage

Mount your Jekyll source files at /target.

    docker run -v $HOME/my_blog:/target heichblatt/jekyll build # override CMD
    docker run -v $HOME/my_blog:/target heichblatt/jekyll # "serve --host=0.0.0.0" is implied by CMD 
