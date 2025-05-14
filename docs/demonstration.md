# Monorepo Scanner Demonstration Package

This document consolidates all materials prepared for the demonstration of the CodeQL Monorepo Scanner. It includes detailed demo flows for various scanning scenarios, concise talking points, concepts for simple visual aids, and a comprehensive dry run outline.

**Objective:** To provide a complete guide for understanding, preparing, and delivering an effective demonstration of the monorepo scanner to a management audience, with a focus on its user-friendliness, efficiency, and automation capabilities.

## Table of Contents

1.  Demo Flow: Scanning an Individual Project
2.  Demo Flow: Scanning a Batch of Projects (Changed Projects)
3.  Demo Flow: Scanning the Entire Monorepo

---

## Demo Flow: Scanning an Individual Project

This section outlines the steps to demonstrate scanning a single project within the monorepo using the CodeQL Monorepo Scanner. The focus is on showcasing the ease of use and targeted scanning capabilities.

**Scenario:** A Security member wants to run a security scan only on a specific project at any time.

**Demonstration Steps:**

1.  **Navigate to GitHub Actions:**
    *   Open the repository in the GitHub web interface.
    *   Go to the "Actions" tab.

2.  **Select the "CodeQL monorepo" Workflow:**
    *   In the list of workflows on the left, click on "CodeQL monorepo".

3.  **Manually Trigger the Workflow:**
    *   Click on the "Run workflow" dropdown button (usually on the right side of the workflow name).
    *   This reveals the manual trigger options.

4.  **Specify the Target Project Folder:**
    *   In the "Type the folder to scan (leave empty to scan all folders)" input field, enter the name of the individual project folder to be scanned (e.g., `project-python-1`).
    *   **Talking Point:** Emphasize how this input field allows users to easily target a specific project, saving time and resources by not scanning the entire monorepo unnecessarily. This highlights the scanner's user-friendliness and efficiency.

5.  **Run the Workflow:**
    *   Click the "Run workflow" button (the green button at the bottom of the dropdown).

6.  **Observe Workflow Execution:**
    *   The workflow run will appear in the list.
    *   Click on the workflow run to see its progress.
    *   **Talking Point:** Point out the "Generate directory list" job, which will identify only the specified project for scanning.
    *   Show the "CodeQL" job matrix, which will now only have one instance for the `project-python-1` (or the specified project).
    *   Highlight that other projects are not being processed, demonstrating the selective scanning feature.

7.  **Review Scan Results:**
    *   Once the workflow completes, navigate to the "Security" tab of the repository.
    *   Under "Code scanning alerts", view the findings.
    *   Filter the alerts by the specific project if necessary (`path:project-python-1`).
    *   **Talking Point:** Discuss how results are integrated directly into GitHub's security interface, providing a familiar and centralized place for developers to review and manage vulnerabilities. This again points to user-friendliness.

8.  **Repeat the steps to scan all projects:**
    *   In the "Type the folder to scan leave empty to scan all folders" on input field.

**Key Takeaways for this Demo Section:**

*   **Ease of Use:** Manually triggering a scan for a specific project or all projects is straightforward via the GitHub Actions UI.
*   **Targeted Scanning:** The scanner efficiently focuses only on the selected project, saving time and computational resources.
*   **Integration:** Results are seamlessly integrated with GitHub Security alerts.

This flow demonstrates a common developer use case and highlights the scanner's precision and user-centric design.

---

## Demo Flow: Scanning a Batch of Projects (Changed Projects)

This section outlines the steps to demonstrate scanning a batch of projects—specifically, those that have been modified in a pull request. This showcases the scanner's automated efficiency and intelligence in a common CI/CD scenario.

**Scenario:** A developer has made changes affecting multiple projects (e.g., `project-java-1` and `project-python-1`) within the monorepo and creates a Pull Request (PR) to the `main` branch. The scanner should automatically identify and scan only these changed projects.

**Demonstration Steps:**

1.  **Prepare Changes in Multiple Projects:**
    *   (Offline Preparation or Simulated) Show a local branch where minor changes have been made to files within two or more distinct project folders (e.g., `project-java-1/src/main/webapp/index.html` and `project-python-1/project_a_vuln.py`).
    *   **Talking Point:** Explain that in a typical monorepo workflow, developers might work on features or fixes that span across several related microservices or libraries.

2.  **Create a Pull Request (or Push to Main):**
    *   Push the local branch to the remote repository.
    *   Navigate to the GitHub repository and create a new Pull Request from the pushed branch to the `main` branch.
    *   Alternatively, for a simpler demo if PRs are complex to set up live, simulate a direct push to `main` containing these multi-project changes (though PRs are a more common trigger for this kind of selective batch scan).
    *   **Talking Point:** Emphasize that the scan is automatically triggered by this common developer action (PR creation), requiring no manual intervention for routine checks. This highlights user-friendliness and automation.

3.  **Observe Automatic Workflow Trigger:**
    *   Go to the "Actions" tab of the repository (or the "Checks" tab of the Pull Request).
    *   Show that the "CodeQL monorepo" workflow has been automatically triggered by the push/PR event.
    *   **Talking Point:** Reinforce that the system is designed for seamless integration into the development lifecycle.

4.  **Inspect Workflow Execution for Batch Processing:**
    *   Click on the automatically triggered workflow run to see its progress.
    *   Focus on the "Generate directory list" job.
        *   Explain that this job now uses the `.github/scripts/list-updated-dirs.sh` script (as per the workflow logic for `push` and `pull_request` events) to identify only the project folders that contain changes (e.g., `["project-java-1", "project-python-1"]`).
        *   **Talking Point:** This is the core of the intelligent batch scanning. The scanner doesn’t waste time on unchanged parts of the monorepo.
    *   Observe the "CodeQL" job matrix.
        *   Show that the matrix now includes jobs for each of the changed projects identified in the previous step (e.g., one for `project-java-1` and one for project-python-1`).
        *   Highlight that these jobs run in parallel (as per the `strategy: matrix` configuration), speeding up the overall scan time for the batch.
        *   **Talking Point:** Parallel execution for the batch of changed projects further enhances efficiency.

5.  **Review Scan Results for the Batch:**
    *   Once the workflow completes, navigate to the "Security" tab of the repository (or the security alerts section of the PR).
    *   Under "Code scanning alerts", view the findings.
    *   Show that alerts are present for the projects that were part of the scanned batch.
    *   **Talking Point:** Results from all scanned projects in the batch are consolidated in the standard GitHub security interface, making review straightforward.

**Key Takeaways for this Demo Section:**

*   **Automation:** Scans are automatically triggered on PRs or pushes to main, fitting naturally into CI/CD.
*   **Intelligent Batching:** Only modified projects are identified and scanned, optimizing resource use.
*   **Parallel Processing:** Changed projects are scanned in parallel, reducing wait times.
*   **User-Friendliness:** No manual steps are needed for this common scenario; results are easily accessible.

This flow demonstrates how the scanner handles changes across multiple projects efficiently and automatically, a key benefit for monorepo management.

---

## Demo Flow: Scanning the Entire Monorepo

This section outlines the steps to demonstrate a comprehensive scan of all projects within the monorepo. This can be triggered manually or occur via a scheduled job, ensuring complete coverage periodically or on demand.

**Scenario 1: Manually Triggering a Full Scan**

A security admin or lead developer wants to initiate a full baseline scan of all projects in the monorepo, irrespective of recent changes.

**Demonstration Steps (Manual Full Scan):**

1.  **Navigate to GitHub Actions:**
    *   Open the repository in the GitHub web interface.
    *   Go to the "Actions" tab.

2.  **Select the "CodeQL monorepo" Workflow:**
    *   In the list of workflows on the left, click on "CodeQL monorepo".

3.  **Manually Trigger the Workflow for All Folders:**
    *   Click on the "Run workflow" dropdown button.
    *   **Crucially, leave the "Type the folder to scan (leave empty to scan all folders)" input field empty.**
    *   **Talking Point:** Emphasize that leaving this field blank is the user-friendly way to tell the scanner to process every project. This is a simple and intuitive design choice.

4.  **Run the Workflow:**
    *   Click the "Run workflow" button (the green button).

5.  **Observe Workflow Execution for Full Scan:**
    *   The workflow run will appear. Click on it to see progress.
    *   Focus on the "Generate directory list" job.
        *   Explain that because the `scan-folder` input was empty and the event is `workflow_dispatch`, the `.github/scripts/list-all-dirs.sh` script is used (as per the workflow logic). This script lists all relevant project directories in the monorepo.
        *   **Talking Point:** This demonstrates the scanner's capability to switch to a full scan mode based on a simple user choice.
    *   Observe the "CodeQL" job matrix.
        *   Show that the matrix now includes jobs for *all* project folders identified by `list-all-dirs.sh` (excluding ignored paths like `docs`).
        *   **Talking Point:** Highlight that all projects are being scanned in parallel, showcasing the system's thoroughness and continued efficiency even in full scan mode.

**Scenario 2: Scheduled Full Scan (Brief Overview)**

The system is configured to automatically perform a full scan of the entire monorepo on a regular schedule (daily) to catch any latent vulnerabilities or ensure ongoing compliance.

**Demonstration Points (Scheduled Full Scan):**

1.  **Show Workflow Configuration for Schedule:**
    *   Briefly revisit the `code-scanning.yml` file.
    *   Point to the `on.schedule` section (e.g., `cron: '0 3 * * *'`).
    *   **Talking Point:** Explain that this cron expression defines when the automated full scan occurs (every day at 03:00 UTC). This is a set-and-forget feature, enhancing security posture without manual effort, which is very user-friendly from an operational perspective.

2.  **Explain Workflow Logic for Scheduled Scans:**
    *   Refer to the `generate-dir-list` job logic in the workflow file again.
    *   Point out the condition: `if [ "${{ github.event_name }}" = "schedule" ] ... then ... dir_list=$(./.github/scripts/list-all-dirs.sh)`. 
    *   **Talking Point:** Explain that when the workflow is triggered by the schedule, it automatically uses the `list-all-dirs.sh` script, ensuring all projects are scanned.

3.  **(Optional) Show a Past Scheduled Run:**
    *   If available, navigate to a previous successful run of the workflow that was triggered by the schedule.
    *   Show that it processed all project directories.

**Review Scan Results (Applicable to both Scenarios):**

*   Once the workflow (manual or scheduled) completes, navigate to the "Security" tab.
*   Under "Code scanning alerts", view the findings.
*   **Talking Point:** All findings from all projects across the entire monorepo are consolidated here, providing a complete security overview.

**Key Takeaways for this Demo Section:**

*   **Comprehensive Coverage:** The scanner can easily perform full scans of the entire monorepo.
*   **User-Friendly Trigger:** A manual full scan is initiated by simply leaving an input field blank.
*   **Automation via Scheduling:** Full scans can be automated for regular security checks, requiring no manual intervention.
*   **Parallel Efficiency:** Even during full scans, projects are processed in parallel to optimize time.

This flow demonstrates the scanner's ability to provide complete security coverage for the entire monorepo, both on-demand and through automation, always keeping user-friendliness in mind.



