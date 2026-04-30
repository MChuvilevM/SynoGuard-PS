# SynoGuard-PS 🛡️ | Total Black Edition
**Automated Health & RAID Monitoring Solution for Synology NAS**

## 📋 Overview
A PowerShell-based enterprise monitoring tool designed for real-time tracking of Synology infrastructure. It provides a high-contrast dashboard for storage pools, disk S.M.A.R.T. status, and critical alerts, specifically optimized for high-availability environments.


![SynoGuard-PS Demo](assets/SynoGuard_Demo.gif)


## 🚀 Key Features
- **Async Monitoring Engine:** High-performance background data retrieval using PowerShell Runspaces.
- **Immersive Dark UI:** Custom WinAPI-integrated "Total Black" dashboard for maximum focus.
- **Health Tracking:** Real-time monitoring of RAID status, latency, and service availability (SSH/ICMP).
- **Enterprise Ready:** Compiled `.exe` build with a professional minimalist icon.

## 🛠 Tech Stack
- **Language:** PowerShell v7.x / .NET
- **GUI:** WinForms with P/Invoke (DWM API for Dark Mode)
- **Compilation:** PS2EXE (x64 Architecture)

## 📅 Roadmap & Progress
- [x] **Phase 1:** Core Logic & Async Engine (Completed 30.04.2026)
- [x] **Phase 2:** GUI Implementation & "Total Black" Styling (Completed)
- [ ] **Phase 3:** Telegram Bot Integration (Upcoming)
- [ ] **Phase 4:** Deep S.M.A.R.T. analytics parsing

## 📦 Installation
1. Go to the **Releases** section.
2. Download `SynoGuard-PS.exe`.
3. Run as Administrator to ensure full network telemetry access.
