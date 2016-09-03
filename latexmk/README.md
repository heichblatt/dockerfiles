# LaTeX Builder in Docker

Sometimes you just want to compile a quick document without installing gigabytes worth of typesetting history.

## Building

Build the image.

``
docker build -t heichblatt/latexmk .
``

## Usage

Run a container. Add the directory with your source file as a volume under /target and specify your source file name as an argument for the entrypoint.

``
docker run -v $(pwd):/target heichblatt/latexmk ./mydocument.tex
``

This will produce mydocument.pdf.