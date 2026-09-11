# Open audit items

Unresolved findings for this repository from the ChatGPT-led audit series
(2026-09-09 through 2026-09-11, passes 1-5; register:
teploy-neutron-lullmail expanded audit). Every P0/P1 finding has been fixed
and verified; the P2/P3 tail below is what remains.

Open items: 0

## Resolved from this register

- useteploy__homebrew-tap-01 — fixed 2026-09-11:
  - CI workflow (`.github/workflows/validate.yml`, weekly + push/PR):
    brew audit for all three formulas and the observe cask, plus an
    install job that smoke-tests every shipped command — teploy's
    installed binary must report the formula's version, teploy-dash and
    the observe cask binary must run, and trmnl goes through a
    non-destructive setup/doctor/uninstall cycle in a temporary HOME.
  - `teploy.rb` gained the version test block; the generating side now
    emits it too (`brews.test` in teploy-cli's .goreleaser.yml), so
    releases regenerate it rather than clobber it.
  - `trmnl.rb` (hand-maintained) gained a test block running the same
    non-destructive cycle.
  - Note: teploy-dash exposes no version command/flag (flags-only
    binary), so its version cannot be asserted from the package; the
    `--help` run plus the formula's pinned asset hashes are the check.
    Giving dash a version command belongs to the teploy-dash repo, not
    the tap.
