# asciidocker

This is a shameful rip-off of the [docker-asciidoctor](https://hub.docker.com/r/asciidoctor/docker-asciidoctor/)
image, but containing PhantomJS (for [WaveDrom](http://wavedrom.com/) support with asciidoctor-diagram)
and based on Ubuntu.

### How to use it

Just build and run:

```
docker build -t asciidocker .
docker run -it -v <your directory>:/documents/ asciidocker
```

Your directory will be directly mapped to `/documents` of the container.

### But why?

I want to use AsciiDoc on a Windows machine and I don't want
to install Ruby on it, hence a container.

I also want to use `WaveDrom`, which is supported by `asciidoctor-diagram`, but
`PhantomJS` and `WaveDrom` are missing from the `docker-asciidoctor` image.

For a `WaveDrom` diagram generation inside a container, I can't use `WaveDromEditor`
because it runs on NW.js, which does not support headless execution. So I need
`PhantomJS` + `wavedrom-cli`.

**But** `PhantomJS` is broken on Alpine because of `musl`: [PhantomJS hangs on even simple examples](https://github.com/ariya/phantomjs/issues/14186)

Which led me to create this monstruously bloated Ubuntu based image (almost 800MB when built).

And yeah, an AsciiDoctor related project with its readme written in Markdown.
