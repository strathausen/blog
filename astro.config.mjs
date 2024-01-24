import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";
import vercel from "@astrojs/vercel/serverless";

// https://astro.build/config
export default defineConfig({
  site: "https://www.stratha.us",
  integrations: [sitemap()],
  redirects: {
    "/2011/12/15/culoar": "/archive/culoare",
    "/2010/03/02/dracula": "/archive/dracula_0-0-2alpha",
    "/2010/03/02/dracula.html": "/archive/dracula_0-0-2alpha",
    "/2009/12/11/ein-tag-im-paradies": "/archive/paradies",
    "/2010/04/25/raphael-svg-tooltip": "/archive/raphael_js_tooltip",
    "/2010/04/25/raphael-svg-tooltip.html": "/archive/raphael_js_tooltip",
    "/2010/08/04/sort_by_colour": "/archive/sort_by_colour",
    "/2010/08/17/drei": "/archive/threetomic",
    "/2d-glasses": "/archive/2d-glasses",
    "/culoare": "/archive/culoare",
    "/dracula_0-0-2alpha": "/archive/dracula_0-0-2alpha",
    "/dracula_0-0-3alpha": "/archive/dracula_0-0-3alpha",
    "/googlerss": "/archive/googlerss",
    "/mumpitz": "/archive/mumpitz",
    "/nodecopter_2012": "/archive/nodecopter_2012",
    "/nodecopter_2013": "/archive/nodecopter_2013",
    "/paradies": "/archive/paradies",
    "/raphael_js_tooltip": "/archive/raphael_js_tooltip",
    "/sort_by_colour": "/archive/sort_by_colour",
    "/terminal-survival-kit": "/archive/terminal-survival-kit",
    "/threetomic": "/archive/threetomic",
    "/unixblog": "/archive/unixblog",
    "/vimify": "/archive/vimify",
    "/wunderkarte": "/archive/wunderkarte",
    "/heroku-awk-pipes-in-colour": "/archive/heroku-awk-pipes-in-colour",
  },
  output: "server",
  adapter: vercel({
    webAnalytics: {
      enabled: true,
    },
  }),
});
