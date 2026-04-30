# SynoGuard-PS 🛡️
**Automated Health & RAID Monitoring Solution for Synology NAS**

## 📋 Overview
A PowerShell-based automation tool designed to interface with Synology DSM REST API. 
The goal is to provide real-time monitoring of storage pools, disk S.M.A.R.T. status, 
and critical infrastructure alerts for high-availability environments (Case Study: CSSV №11).
![SynoGuard-PS Demo](assets/SynoGuard_Demo.gif)

## 🚀 Key Features (In Development)
- **API Integration:** Seamless auth and data retrieval from Synology WebAPI.
- **Health Engine:** Automated parsing of RAID status and thermal metrics.
- **Smart Alerting:** Instant notifications via Telegram/Event Log upon degradation.
- **Wibe UI:** Responsive PowerShell-based dashboard for system admins.

## 🛠 Tech Stack
- **Language:** PowerShell Core
- **Protocol:** REST API (HTTPS)
- **Target:** Synology NAS (DSM 7.x)

## 📅 Roadmap
- [ ] Phase 1: API Authentication & Storage Pool parsing (Expected: 27.04.2026)
- [ ] Phase 2: Telegram Bot Integration
- [ ] Phase 3: GUI Dashboard implementation
