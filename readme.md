wintersmith-hogan
==================

Hogan templates for [Wintersmith](https://github.com/jnordberg/wintersmith)

## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-hogan
```

and add `wintersmith-hogan` to your config.json

```json
{
  "plugins": [
    "wintersmith-hogan"
  ]
}
```

## Naming conventions

Assumes all templates have the `.mustache` extension

File names of partials must match the names with which they are referenced.
e.g. `cool_template.mustache` would be referenced using `{{> cool_template}}`
