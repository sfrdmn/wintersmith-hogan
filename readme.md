
# wintersmith-hogan

[hogan](https://github.com/twitter/hogan.js) plugin for [wintersmith](https://github.com/jnordberg/wintersmith)

install:

`npm install wintersmith-hogan -g`
then add `wintersmith-hogan` to your plugins in the wintersmith config

## Partials

Assumes partials are in a subdirectory named **partials** in your template directory and that the files are given the same name they are referenced with in the template.

I.E. for a file **index.mustache** in `./templates` containing:

    {{>header}}
    <section>
      <p>sup</p>
    </section>

There would exist a file in `./templates/partials` called **header.mustache**

**header.hogan** would also work.
