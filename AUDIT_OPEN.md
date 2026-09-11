# Open audit items

Unresolved findings for this repository from the ChatGPT-led audit series (2026-09-09 through 2026-09-11, passes 1-5; register: teploy-neutron-lullmail expanded audit). Every P0/P1 finding has been fixed and verified; the items below are the remaining P2/P3 tail plus one item needing validation. Fields are quoted from the audit register; line references point at the review commits listed per item where recorded.

Open items: 1 P2 (1 total)

## useteploy__homebrew-tap-01 - P2 - Open improvement

**Add meaningful package-install tests for every shipped command**

- Kind: Improvement
- Evidence: teploy.rb and trmnl.rb contain no test block; teploy-dash.rb only runs --help. The tracked tap has no CI workflow. Generated formulas identify GoReleaser as their source.
- Impact: Release automation may publish valid-looking manifests whose binaries or configuration resources do not function after installation.
- Proposed fix: Add package tests in the generating release config as well as tap validation. Test the expected version for CLI/dashboard and perform a non-destructive trmnl setup/doctor/uninstall cycle in a temporary home.
- Acceptance test: Run clean install/upgrade tests across every advertised target and verify expected binaries and configuration resources.
- Review commit: `bfd676a7ce5f03b5640094a9b48df402fbccafea` (last reviewed 2026-09-10)

