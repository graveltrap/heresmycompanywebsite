# Overnight build report — 2026-07-05 → 06

## It's all live

**https://github.com/graveltrap/heresmycompanywebsite** → **http://mybusinessweb.site**

- Homepage: http://mybusinessweb.site
- All 22 demos live and verified, e.g.:
  - http://mybusinessweb.site/mrconeys — Mr. Coney's Barbershop
  - http://mybusinessweb.site/legacylounge — Legacy Lounge
  - http://mybusinessweb.site/boulevardvacuum — Boulevard Vacuum & Sewing (est. 1946)
  - http://mybusinessweb.site/launicamidcity — Tacos y Birria La Unica
  - http://mybusinessweb.site/lucysdrivein — Lucy's Drive In
  - full list in [target-list.md](target-list.md)

## What happened overnight

1. **Infra**: gh CLI installed + authed as graveltrap; public repo created & pushed; GitHub Pages enabled; Squarespace DNS for mybusinessweb.site rewired to GitHub Pages (4 A records + www CNAME; parking preset auto-removed; the no-send email security TXT records were kept — good for the burner-domain outreach rule). Public DNS fully propagated.
2. **Research**: 3 parallel agents swept Pico (3800–5800 blocks), S La Brea (Pico↔Venice), Venice Blvd, and San Vicente. Every candidate was checked for an existing website. Result: **18 tier-1 prospects (no site at all), 3 upgrade-tier (placeholder/thin sites)** — see target-list.md, which also records skips/closures.
3. **Build**: 21 hand-tailored single-page demos (4 parallel design agents), each with a distinct palette/typography/layout keyed to the business's social-media vibe. All pass the guardrail validator (docs/validate-demos.ps1): DEMO CONCEPT banner, noindex/nofollow/noarchive, disclosure footer, text-only branding, zero external assets, no business phone/email.
4. **Verification**: all 22 live URLs fetched and checked for banner + noindex; robots.txt (28 lines, per-slug Disallow) confirmed live; identity sweep clean (no personal name/phone/email anywhere, commits authored as `heresmycompanywebsite <graveltrap@users.noreply.github.com>`).

## Notable finds & judgment calls (anything can be changed)

- **CHOPZ LA already has a website (chopzla.com)** — kept as a portfolio showcase, marked DO-NOT-PITCH.
- **The Upper Room, Rubio's Bakery, Lucy's Drive In** have weak placeholder sites — built demos anyway as "upgrade pitch" tier.
- **Best first pitches** (my read): Mr. Coney's (4.5★, dead domain listed on Yelp), LA Tires (198 reviews, broken site listing), Body Builders Automotive (4.8★, competitor next door HAS a site), Dub's (est. 2001, template-squatter domain), M Barbering (strong brand voice, zero web).
- **Auto Brake Center**: its storefront shows up in lease listings — verify it's still open before pitching.

## Open items

- **HTTPS cert**: GitHub/Let's Encrypt issuance was still pending at report time (DNS had just propagated). A background retry was enabling `https_enforced` the moment the cert lands. If http:// works but https:// doesn't in the morning, check: `gh api repos/graveltrap/heresmycompanywebsite/pages` — and if needed re-run `gh api -X PUT ... -F https_enforced=true`.
- **.com/.site/.net redirects** to mybusinessweb.site: not set up yet (Squarespace domain forwarding, ~2 min each in the UI).
- **Legacy Pages builds sometimes hang** — if a push doesn't deploy, `gh api -X POST repos/graveltrap/heresmycompanywebsite/pages/builds` re-kicks it (needed twice tonight). Consider switching to the Actions build type if it keeps happening.
- Outreach/burner domains: next phase, nothing done (per the deliverability rule, nothing outreach-related touches these domains).
