# Pirates Peril rescue status

## Pinned release stack

- GameMaker IDE/runtime: 2026.0 LTS, GMS2 runtime (not GMRT)
- Windows target: VM
- Steamworks extension: GMEXT-Steamworks 2.2.1
- Steamworks SDK: 1.63, expected at `../Steamworks_sdk`
- Development Steam App ID: 480
- Release language: English

The real Steam App ID must replace 480 before release packaging. Steam Auto-Cloud must include `savedgame.save` and `savedgame.bak` from GameMaker's per-user save directory.

## Steam backend configuration

Create a descending, keep-best integer leaderboard named `PP_HIGH_SCORE` and these achievements:

- `ACH_FIRST_SINK`
- `ACH_REPUTATION_3`
- `ACH_REPUTATION_5`
- `ACH_TREASURE_SHIP`
- `ACH_FERRET_RESCUE`
- `ACH_FULLY_UPGRADED`

The game remains playable when Steam is unavailable. Completed runs save locally before leaderboard synchronization is attempted.

## Source-control recovery points

- Archive tag: `archive/pre-rescue-2024-11-01`
- Working branch: `rescue/pirates-peril-v1`
- Canonical project: `Pirates Peril.yyp`

## Validation still requiring the release workstation

Install GameMaker 2026.0 LTS and its Windows GMS2 VM runtime, then supply the partner-only Steamworks SDK 1.63. Run clean Debug and Release packages, controller hot-plug/rebinding checks, Steam online/offline tests, save migration/corruption tests, and the 30-minute soak test before release acceptance.
