
# Doku for this repository

## Branch 'issue3037'
###  .RSSLink points to wrong destination #3037

Commit 220184e07098454953a10fe630ca9585072bfdf9

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
PreserveTaxonomyNames = true    
V0.18.1    

### Test V0.19

Commit d62466b74feb3cde90cc200f67e67d5f47e14d43

I updated the RSS section of the template to render RSS from pages to .Site.RSSLink and from taxonomy pages to the taxonomy RSS feed.

```
    {{ if eq .Kind "page" }}
        <link href="{{ .Site.RSSLink }}" rel="alternate" type="application/rss+xml" title="{{ .Site.Title }}" />        
    {{ else }}
        <link href="{{ .RSSLink }}" rel="alternate" type="application/rss+xml" title="{{ .Title }}" />
    {{ end }}
```

I can't open any taxonomy pages since all links are wrong => with `PreserveTaxonomyNames = true` taxonomy pages will render to a mix of Capital and small letters whereas the generated links in the header show all in small letters => new bug.
Besides that when I open `http://localhost:1313/tags/Tutorial.html` manually to get the list page the rss link inside is `http://localhost:1313/tags/tutorial.xml` whereas the xml location is still  `/tags/Tutorial/index.xml`

*****
uglyURLs = true    
relativeURLs = true    
canonifyURLs = false
PreserveTaxonomyNames = true    
V0.19   


#### update: Commit 
with `PreserveTaxonomyNames = false` at least my taxonomy pages are working, but RSS feed links in taxonomy listing pages are still wrong:
From `http://localhost:1313/tags/tutorial.html` it still points to `http://localhost:1313/tags/tutorial.xml` whereas the file is located in `/tags/tutorial/index.xml`






