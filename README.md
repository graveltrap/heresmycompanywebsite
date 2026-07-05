# Here's My Company Website

AI-automated web development for local brick-and-mortar businesses with no web presence. A venture of [Coupling Labs](https://couplinglabs.ai) with its own identity.

**Model:** find a local business with no website → AI-generate a tailored demo homepage → host it live under this brand → use the live demo as a warm, zero-obligation pitch.

## Domains

| Domain | Role |
|---|---|
| `heresmycompanywebsite.com` | Flagship — homepage + hosted demos |
| `heresmycompanyweb.site` | 301 → .com |
| `heresmycompanywebsite.net` | 301 → .com |

DNS at Squarespace. Currently structured for **GitHub Pages** hosting (account `graveltrap`), with a planned migration path.

## Demo URL scheme (and the wildcard constraint)

GitHub Pages **does not support wildcard subdomains** — `chopzla.heresmycompanywebsite.com` cannot be served from one Pages site, and per-demo subdomains would each need their own repo + CNAME record. So:

- **Now (GitHub Pages):** path-based demos — `heresmycompanywebsite.com/demos/chopzla/`. One repo, one Pages site, zero DNS churn per demo. Adding a demo = adding a folder.
- **Later (subdomain look):** migrate hosting to **Cloudflare Pages or Netlify**, which support wildcard/branch subdomains, and flip DNS to get `chopzla.heresmycompanywebsite.com`. The repo layout (one folder per demo, static HTML) migrates as-is.
- Squarespace DNS changes are manual and deliberate — never automated.

## Repo layout

```
index.html                      # public homepage — what the service is
robots.txt                      # Disallow: /demos/  (demos never indexed)
templates/demo-template/        # canonical demo template + config schema
demos/<slug>/index.html         # one folder per generated demo
docs/                           # pipeline + policy docs
```

## Pipeline

1. **Prospect** — identify zero-web-presence businesses (initial corridor: W Pico Blvd, LA 90019). Source facts from public listings only (name, address, category, rating).
2. **Generate** — fill `templates/demo-template/` from a `demo.config.json` per business; hyper-local copy, brand colors chosen to suit, no scraped assets.
3. **Publish** — add `demos/<slug>/`, deploy. Demo is live but noindexed and disclosed.
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

## Identity rules

- No personal names, phone numbers, or personal email addresses anywhere in this repo, its content, or its commit metadata. Repo-local git identity is the brand + a GitHub noreply address.
- Public contact is deferred; when it arrives it will be email-only, mirroring Coupling Labs policy.
