# BOLD - Flutter Mobile Trading Platform Architecture

## 1. Project Overview & Scope
BOLD is an institutional-grade Indian equities and derivatives trading, research, and paper-trading platform built in Flutter.
- **Operating Boundary:** Simulated paper trading only at launch. Zero live order routing.
- **Broker Connections:** Read-only portfolio and position sync adapters.
- **Free Launch Policy:** 100% of all features, including algo backtests and options analytics, are free at launch with ₹10,00,000 starting virtual capital.

---

## 2. Design System Tokens (SOP Section 2)
| Token | Hex Value | Semantic Usage |
|---|---|---|
| **App Background** | `#0B0F14` | Primary scaffold & workspace background |
| **Surface** | `#121923` | Cards, panels, bottom navigation |
| **Elevated Surface** | `#1C2734` | Selected states, active tabs, modal overlays |
| **Primary / Bullish** | `#38D996` | Buy buttons, positive P&L, bullish signals |
| **Bearish / Loss** | `#FF657A` | Sell buttons, negative P&L, bearish signals |
| **Warning** | `#F3C969` | Risk disclaimers, margin notices |
| **Accent Blue** | `#3B82F6` | Info icons, technical badges |
| **Primary Text** | `#EAF0F6` | Headlines, quotes, primary labels |
| **Secondary Text** | `#92A0B2` | Subtitles, helper text, timestamps |

* **Typography:** Inter with tabular numerals for prices and P&L.
* **Layout Geometry:** 8 dp base grid, 16–20 dp screen margins, 12–16 dp card radius, 48 dp minimum interactive targets.

---

## 3. Screen Matrix (S01 – S21)
| ID | Screen Name | Route | Module Location |
|---|---|---|---|
| **S01** | Splash & Onboarding | `/` | `features/s01_onboarding/` |
| **S02** | Login & Verification | `/login` | `features/s02_auth/` |
| **S03** | Personalization | `/personalization` | `features/s03_personalization/` |
| **S04** | Home Dashboard | `/dashboard` | `features/s04_dashboard/` |
| **S05** | Market Overview | `/market_overview` | `features/s05_market_overview/` |
| **S06** | Watchlists | `/watchlist` | `features/s06_watchlist/` |
| **S07** | Advanced Charts | `/chart` | `features/s07_charts/` |
| **S08** | Market Scanner | `/scanner` | `features/s08_scanner/` |
| **S09** | Instrument Research | `/research` | `features/s09_research/` |
| **S10** | AI Assistant | `/ai_assistant` | `features/s10_ai_assistant/` |
| **S11** | Options Desk | `/options` | `features/s11_options_desk/` |
| **S12** | Strategy Builder | `/strategy_builder`| `features/s12_strategy_builder/` |
| **S13** | Backtest Results | `/backtest_results`| `features/s13_backtest/` |
| **S14** | Paper Terminal | `/paper_terminal` | `features/s14_paper_terminal/` |
| **S15** | Signals Feed | `/signals` | `features/s15_signals/` |
| **S16** | Portfolio & Journal | `/portfolio` | `features/s16_portfolio/` |
| **S17** | Broker Hub | `/broker_hub` | `features/s17_broker_hub/` |
| **S18** | Alerts & Push | `/alerts` | `features/s18_alerts/` |
| **S19** | Subscription Plan | `/subscription` | `features/s19_billing/` |
| **S20** | Profile & Security | `/profile` | `features/s20_profile/` |
| **S21** | Admin Console | `/admin` | `features/s21_admin_console/` |

---

## 4. Directory Structure
```text
D:\client project\
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   ├── features/
│   │   ├── s01_onboarding/
│   │   ├── s02_auth/
│   │   ├── s03_personalization/
│   │   ├── s04_dashboard/
│   │   ├── s05_market_overview/
│   │   ├── s06_watchlist/
│   │   ├── s07_charts/
│   │   ├── s08_scanner/
│   │   ├── s09_research/
│   │   ├── s10_ai_assistant/
│   │   ├── s11_options_desk/
│   │   ├── s12_strategy_builder/
│   │   ├── s13_backtest/
│   │   ├── s14_paper_terminal/
│   │   ├── s15_signals/
│   │   ├── s16_portfolio/
│   │   ├── s17_broker_hub/
│   │   ├── s18_alerts/
│   │   ├── s19_billing/
│   │   ├── s20_profile/
│   │   └── s21_admin_console/
│   └── navigation/
│       ├── app_router.dart
│       └── main_scaffold.dart
├── pubspec.yaml
└── README.md
```
