# EarmarkDingus

## SYNOPSIS

This is an extremly simple Dingus Server allowing to integrate 
[Earmark](https://github.com/pragdave/earmark)  into the [Babelmark2](http://johnmacfarlane.net/babelmark2/) project.


It follows the specification for such an integration, as specified [here](https://pairlist6.pair.net/pipermail/markdown-discuss/2012-October/002690.html)

In other words a get request with the following `text` parameter

```
    ...?text="**Hello** _World_"
```

will return a json response like the following 

```
{ "name": "Earmark",
  "version": "0.1.18",
  "html": "<p><strong>Hello</strong> <em>World</em></p>\n",
  "author": "Dave Thomas",
  "website": "https://github.com/pragdave/earmark"
}"
```

like this.

## LICENSE

Copyright © 2015 Robert Dober

Licensed under the same terms as Elixir.
