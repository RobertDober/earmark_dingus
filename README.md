# EarmarkDingus2

## SYNOPSIS

This is an extremly simple Dingus Server allowing to integrate 
[Earmark](https://github.com/pragdave/earmark)  into the [Babelmark2](http://johnmacfarlane.net/babelmark2/) project.


It follows the specification for such an integration, as specified [here](https://pairlist6.pair.net/pipermail/markdown-discuss/2012-October/002690.html)

In other words a get request with the following `text` parameter

```
    ...?text="**Hello** _World_"
```

will return a json response like the following example:

```
{ "name": "Earmark",
  "version": "1.1.1",
  "html": "<p><strong>Hello</strong> <em>World</em></p>\n",
  "author": "Dave Thomas",
  "website": "https://github.com/pragdave/earmark"
}"
```

## TESTING

It is deployed to Heroku on this [app](https://sleepy-depths-5324.herokuapp.com/?text=__Earmark__).

## LICENSE

Copyright © 2015/7 Robert Dober

Licensed under the same terms as Elixir, see [LICENSE](LICENSE) for details.
