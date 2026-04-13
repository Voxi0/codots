// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import starlightThemeBlack from "starlight-theme-black"
export default defineConfig({
	site: "https://codots.pages.dev",
	integrations: [
		starlight({
			title: "codots",
			favicon: "/favicon.svg",
			logo: {src: "./public/favicon.svg", replacesTitle: false},
			social: [{ icon: "github", label: "GitHub", href: "https://github.com/constructor2828-web/codots" }],
			plugins: [
				starlightThemeBlack({
					navLinks: [{
						label: "docs",
						link: "/getting-started",
					}],
					footerText: ""
				})
			],
			sidebar: [
				{
					label: "Getting Started",
					items: [
						"getting-started/installation",
						"getting-started/post-installation"
					],
					collapsed: false,
				},
			],
		}),
	],
});
