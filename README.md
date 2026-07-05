# Here's My Company Website

AI-automated web development for local brick-and-mortar businesses with no web presence. A venture of [Coupling Labs](https://couplinglabs.ai) with its own identity.

**Model:** find a local business with no website → AI-generate a tailored demo homepage → host it live under this brand → use the live demo as a warm, zero-obligation pitch.

## Domains

| Domain | Role |
|---|---|
| `mybusinessweb.site` | **Live domain** — homepage + hosted demos (short, owner-friendly URLs) |
| `heresmycompanywebsite.com` | Brand/story domain — 301 → live domain (or future marketing page) |
| `heresmycompanyweb.site` | 301 → live domain |
| `heresmycompanywebsite.net` | 301 → live domain |

DNS at Squarespace. Currently structured for **GitHub Pages** hosting (account `graveltrap`); `CNAME` file pins the custom domain.

## Demo URL scheme

Demos live at root paths on the live domain: **`mybusinessweb.site/<slug>`** (e.g. `mybusinessweb.site/chopzla`). One repo, one Pages site — adding a demo = adding a folder. Notes:

- GitHub Pages does not support wildcard subdomains, so root-path demos are also the friction-free choice here. If subdomain-style URLs are ever wanted, migrate to Cloudflare Pages/Netlify; the folder-per-demo layout carries over.
- Every new demo folder gets a matching `Disallow: /<slug>/` line in robots.txt.
- Squarespace DNS changes are manual and deliberate — never automated.

## Repo layout

```
index.html                      # public homepage — what the service is
CNAME                           # mybusinessweb.site (GitHub Pages custom domain)
robots.txt                      # Disallow per demo slug (demos never indexed)
templates/demo-template/        # canonical demo template + config schema
<slug>/index.html               # one root-level folder per generated demo
docs/                           # pipeline + policy docs
```

## Pipeline

1. **Prospect** — identify zero-web-presence businesses (initial corridor: W Pico Blvd, LA 90019). Source facts from public listings only (name, address, category, rating).
2. **Generate** — fill `templates/demo-template/` from a `demo.config.json` per business; hyper-local copy, brand colors chosen to suit, no scraped assets.
3. **Publish** — add `/<slug>/` folder + robots.txt Disallow line, deploy. Demo is live but noindexed and disclosed.
4. **Pitch** — outreach (see deliverability rule below) linking to the live demo.
5. **Convert or delete** — client signs: site is finished and moved to their own domain. No response / declined: demo folder is deleted.

## Demo guardrails (mandatory, baked into the template)

1. **Text-only branding** — the business name is rendered as styled text. Never scrape or recreate their logo, photos, or graphics.
2. **Persistent disclosure banner** on every demo: *"DEMO CONCEPT: This is a private web proposal built by Here's My Company Website. Not affiliated with the business."*
3. **Never indexed** — `<meta name="robots" content="noindex, nofollow, noarchive">` in every demo `<head>` **and** `Disallow: /demos/` in root robots.txt.
4. **No implied affiliation** — no business phone/email links; address as public-record text only. Footer restates non-affiliation and removal-on-request.

## Outreach & deliverability rule — NON-NEGOTIABLE

**Cold outreach is NEVER sent from the hosting domains.** No email is ever sent from `heresmycompanywebsite.com/.site/.net` addresses for prospecting. Cold email risks spam-flagging and domain-reputation damage; the hosting domains must stay pristine so demo links always load and never land pitches in spam.

- Outreach uses **separate, disposable burner domains** purchased for that purpose, warmed and rotated independently.
- The hosting domains carry only the website, demo links, and (eventually) inbound contact.
- If a burner domain gets burned, it's discarded; hosting reputation is untouched.

## Ops docs live elsewhere

This repo is public (required for free GitHub Pages). Prospect lists, pitch strategy, research data, and reports live in a private local folder (`C:\Claude\mybusinessweb-ops\`), never in this repo. Only the validator script stays in `docs/`.

## Identity rules

- No personal names, phone numbers, or personal email addresses anywhere in this repo, its content, or its commit metadata. Repo-local git identity is the brand + a GitHub noreply address.
- Public contact is deferred; when it arrives it will be email-only, mirroring Coupling Labs policy.
