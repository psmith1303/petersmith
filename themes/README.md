# NEWS

A responsive mobile-first theme for [Hugo](https://gohugo.io/), that is pretty clean and light weight, although it does use [Font Awesome](http://fontawesome.io/) and [Adobe Typekit fonts](https://typekit.com/foundries/adobe).


## Installation

In the root directory of your hugo site, clone the theme. I.e.,:

    git clone https://github.com/psmith1303/hugo-news

You can then try out the theme, in the usual way

	hugo --theme hugo-news --verbose server
	
If you then want to make this permanent, then in your `config.toml` add/change the line that specifies your theme. I.e.,:

	theme = "hugo-news

Then do what ever you normally do to regenerate and deploy your site.

## Fonts

To make this work well, you'll need some stuff from [Font Awesome](http://fontawesome.io/) and [Adobe Typekit fonts](https://typekit.com/foundries/adobe).

The necessary .CSS files are already installed, but to get the Adobe fonts working you'll need to tweak some things to make it work --- the code contains a user specific ID that is tied to the website using the fonts. If you don't make these changes, the theme should fall back to using a serif font.

First sign-up for Adobe TypeKit fonts, and add the two fonts "Museo Slab" and Merriweather to a kit. 

In the file `hugo-news/layouts/partials/javascript.html' the "embed code" for that kit should then been used in place of:

    <script src="https://use.typekit.net/unx3bdf.js"></script>
    <script>try{Typekit.load({ async: true });}catch(e){}</script>



## License

Good old GNU
