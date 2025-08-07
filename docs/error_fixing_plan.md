# Error-Fixing Plan

## 1. Detect and Log Errors
- Run `flutter analyze` to find all errors.
- Save all errors with their details from the analysis output.
- Keep errors in memory until resolved or marked unresolvable.
- **Output:** Error list.

## 2. Categorize Errors
- Group errors based on their nature from analysis output.
- Prioritize based on impact (e.g., errors preventing build first).
- **Output:** Prioritized error groups.

## 3. Find Root Causes
- For each error:
    - Read all related project files to understand the error fully.
    - Check project structure and file contents to identify the cause.
    - Verify referenced elements (e.g., files, functions) exist and are correct.
    - If an element is missing, search project structure for it.
    - If still missing, check project documentation to confirm if it should exist.
    - If documentation confirms, prepare to create it with correct content and location.
    - If unclear, mark as unresolvable and document the reason.
- **Output:** Report per error (ID, cause, related files, evidence from project).

## 4. Propose Fixes
- Suggest one minimal fix per error based only on project data.
- Ensure the fix:
    - Addresses only the error.
    - Does not affect application functionality.
- For creating elements (e.g., files, functions):
    - Only create if documentation confirms purpose and content.
    - Use project patterns for content and location.
    - If unclear, skip and document.
- Check if the fix resolves other errors (e.g., fixing one issue may resolve related errors).
- **Output:** Proposal (ID, change, reason from project data, impact).

## 5. Apply and Verify Fixes
- Apply the change.
- Run `flutter analyze` to check if the error is fixed and no new errors appear.
- If the fix fails or causes new errors:
    - Revert the change.
    - Re-read related files and project structure.
    - Suggest a new fix based on new analysis.
- Run commands only if needed based on changes:
    - `flutter pub get` if dependencies changed.
    - `flutter clean` if build issues persist after changes.
- **Output:** Updated error list (e.g., "E001: Fixed").

## 6. Avoid Loops
- Log each attempt:
    ```
    ErrorID | Attempt | Action | Files Changed | Result | Next Step
    E001    | 1       | Fix issue | file.dart | Failed | Re-analyze
    ```
- Do not repeat actions (e.g., `flutter clean`, `flutter pub get`) unless code changes justify it.
- After two failed attempts:
    - Mark as "needs developer review."
    - Document attempts and reasons.
- **Output:** Attempt log.

## 7. Finalize and Report
- Run `flutter analyze` to confirm no errors or list remaining ones.
- If no errors, update GitHub with a commit:
    ```markdown
    fix: Resolved [N] errors
    - Fixed [Error ID]: [Description] in [File]
    - Created [Element] per documentation
    - Unresolved: [Error ID] - [Reason]
    - Verified: `flutter analyze` results
    ```
- Push to GitHub.
- Report to developer:
    - Errors fixed
    - Unresolved errors (reasons)
    - Commands run
    - Verification results
    - Flag errors needing input.
- **Output:** Commit message and report.

## 8. Strict Rules
- Use only project files and documentation for fixes.
- Do not change functionality unless required.
- Create elements only if documentation confirms.
- One change per error.
- Verify with `flutter analyze`.
- No repeated actions unless justified.
- Document all actions and failures.
