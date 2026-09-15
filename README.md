# MedNEST MVP

A Flutter-based healthcare recruitment platform connecting medical professionals with institutions. 

## Overview
MedNEST is designed to streamline the recruitment process in the healthcare sector. This MVP version provides a fully connected UI flow demonstrating the core user journeys for three distinct roles: Professionals, Institutions, and Admins.

## Features

### 1. Professional Journey
*   **Role Selection**: Choose the Professional role to access the dedicated dashboard.
*   **Dashboard**: View profile completion, verification status, and recommended jobs.
*   **Job Discovery**: Search, filter, and discover available healthcare jobs.
*   **Application Tracking**: Apply to jobs and track your application status timeline (Applied -> Reviewed -> Shortlisted -> Interview -> Offered).

### 2. Institution Journey
*   **Dashboard**: View active jobs, total applicants, and recent applications.
*   **Candidate Review**: Review applicant profiles, check verified credentials, view their timeline, and make decisions to shortlist or reject candidates.
*   **Job Management**: Interface for managing published jobs.

### 3. Admin Journey
*   **Dashboard**: Monitor platform statistics (professionals, institutions, jobs, complaints).
*   **Approvals**: Manage pending verifications for professionals and institutions.
*   **Subscriptions**: Manage Razorpay payment integration and subscription plans.

## Getting Started

### Prerequisites
*   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
*   A suitable IDE (e.g., VS Code, Android Studio).
*   Windows desktop development environment setup (for running the Windows desktop app).

### Installation & Running
1. Clone the repository:
   ```bash
   git clone https://github.com/AdityaxDeore/MetalBuild.git
   cd MetalBuild
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application (Windows Desktop):
   ```bash
   flutter run -d windows
   ```
   *Alternatively, you can run the provided `run_mednest.bat` file if you have already built the Windows release.*

## Project Structure
*   `lib/main.dart` - Application entry point.
*   `lib/screens/` - Contains all the UI screens (Dashboards, Detail screens, Navigations).
*   `lib/theme/` - Contains application-wide theme and color constants (`app_colors.dart`).

## Technologies
*   **Framework**: Flutter
*   **Language**: Dart
*   **Target Platform**: Windows (Desktop MVP)
