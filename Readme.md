
# Doku for this repository

## Overview over the snapshots with some basic info
This gives a description of the changes I did from step to step and the issues involved

### Base tree
[Link](https://github.com/ominty/ominty-hugoissues/tree/41a0acbd4c9531da565cb0092b1e0ee873dade8c) - this includes the following:

- Classical Home Page with starting page in each section called `intro.html` (first menu entry in side-nav in "Wohnmobil", "Hunde" and "Kontakt")
- Blog section ("Blog")
- I use `_index.html` for front matter in the list pages of the home page sections - this works, but the `_index.html` is treated as normal content page and thus creates a link in the sidenav.
- RSS link in header points to `/index.xml` for all pages

### Tree "RSS Taxonomies and _index filtered"
[Link](https://github.com/ominty/ominty-hugoissues/tree/84ea0e0650a0f063209945ac7b855d388790b4dd)  - this includes the following:

- .RSSlink activated - see Issue #3037 below
- sidenav modified to exclude `_index.md` in sections (as this should be frontmatter and content to sections list files only)

### Tree "index.md  within section link renders to wrong place"
[Link](https://github.com/ominty/ominty-hugoissues/tree/16555037268e1b3266a6144876f34ea46daf4963)  - this includes the following:

- all `intro.md` have been renamed to `index.md` in the sections
- `config.toml` , teasers on the homepage and sidenav have been adjusted 

I find this working: create a `/section/index.md` in a section and it renders to `/section/index.html` in that same section in the public folder.

> index.md or foo.md is content and metadata for the single pages,

I like to have an index-file in each content subdirectory as every webserver I know will deliver this when a user uses an address like `http://domain.tld/section/`.
All works fine so far.

I use  the following structure:

```
.
├── config.toml
├── archetypes
├── content
|   ├── _index.md
|   ├── womo
|   |   ├── index.md
|   |   ├── fahrgestell.md
|   |   ├── aufbau.md
|   |   ├── einrichtung.md
|   |   └── {more pages}.md
|   ├── hund
|   ├── blog
|   └── kontakt
├── static
├── data
├── layouts
└── themes
```

and this renders to

```
.
└── public
    ├── index.html
    ├── womo.html
    ├── womo
    |   ├── index.html
    |   ├── fahrgestell.html
    |   ├── aufbau.html
    |   ├── einrichtung.html
    |   └── {more pages}.html
    ├── hund.html
    ├── hund
    ├── blog.html
    ├── blog
    ├── kontakt.html
    └── kontakt
```

which is ok so far - and as expected following [@bep](/users/bep) 's definition.

Now I use the following code to produce a sidenav within the womo section. 

```
<ul> 
            {{ $act_section := .Section}}                  
            {{ range where .Site.Pages "Section" $act_section }}       
        	<li><a href="{{ .RelPermalink }}">{{- .LinkTitle -}}</a></li>    
            {{ end }}      
</ul>
```
It ends up like this:

```
<li><a href="../womo.html">Einführung</a></li>                   
<li><a href="../womo/fahrgestell.html">Fahrgestell</a></li>            
<li><a href="../womo/aufbau.html">Aufbau</a></li>            
<li><a href="../womo/einrichtung.html">Einrichtung</a></li>
```

which obviously is wrong since the first line should be like

```
<li><a href="../womo/index.html">Einführung</a></li>
```

So at least for creating the menue index.md is NOT treated as content and metadata for a single page.

Hugo uses linktitle from the frontmatter of `/section/index.md` but the created link instead points to `/section.html` which gives a simple list but not the content of `/section/index.md`. 

That's why I used to rename `/section/index.md` to something else like `/section/intro.md` in the snapshots above and everything worked fine.     
(But then, off course, I have to tweak the server config to use intro.html as default page also which I personally do not prefer).

**In this example you can access the first page in each section through the top navigation (as the link is defined in `config.toml`) but from within the section it's impossible to get to that page by using the first of the sidenav-links (e. g. "Steckbriefe" in "Hunde") as this wrongly points to the list (but I have `_index.md` for that purpose)** 


## Issues filed 
[see here](https://github.com/spf13/hugo/issues/)

### index.md within section - link renders to wrong place #3102

detailed description see above: **Tree "index.md  within section link renders to wrong place"**

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