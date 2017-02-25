
# Doku for this repository

## Base tree
[Link](https://github.com/ominty/ominty-hugoissues/tree/41a0acbd4c9531da565cb0092b1e0ee873dade8c)
includes the following:

- Classical Home Page with starting page in each section called `intro.html` (first menu entry in side-nav in "Wohnmobil", "Hunde" and "Kontakt"
- Blog section ("Blog")
- I use `_index.html` for front matter in the list pages of the home page sections - this works, but the `_index.html` is treated as normal content page and thus creates a link in the sidenav.
- RSS link in header points to `/index.xml` for all pages

## Issues filed 
[see here](https://github.com/spf13/hugo/issues/)

###  .RSSLink points to wrong destination #3037

I use this from the docs:

```
{{ if .RSSLink }}
<link href="{{ .RSSLink }}" rel="alternate" type="application/rss+xml" title="{{ .Site.Title }}" />
{{ end }}

```
(Link is found in the theme in /partial/header.html)

and I end up with RSS links in the form of
[http://www.example.com/{section-name}.xml](http://www.example.com/%7Bsection-name%7D.xml)
instead of
[http://www.example.com/{section-name}/index.xml](http://www.example.com/%7Bsection-name%7D/index.xml)
where indeed I can find the relevant feed file.











*****
uglyURLs = true
relativeURLs = true
canonifyURLs = false
V0.18.1