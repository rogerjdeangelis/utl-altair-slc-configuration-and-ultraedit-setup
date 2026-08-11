# UltraEdit Multi-Key Shortcut Chords — Cheat Sheet

## What Is a Chord?

A **chord** (or "multi-key key-mapping") is a two-part keyboard shortcut: you press a first key combination, then a second key combination **in quick succession**. UltraEdit waits during a configurable delay period for the second keystroke before executing the first key's normal action.

```
Format:  First Key  →  Second Key  →  Action fires
Example: Ctrl+R     →  M           →  Open File Under Cursor
```

Each part of the chord can include modifier keys (Ctrl, Shift, Alt). Per the UltraEdit-32/UEStudio Help manual, each field accepts up to three keys (e.g., `Ctrl+Shift+T`). The two parts are entered into two separate text fields in the Key Mapping dialog ([UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping); [UltraEdit-32/UEStudio Help manual](https://emidatasets.blob.core.windows.net/publicdata/Datasets/Wholesale/_AdditionalInformation/ArchivedDatasets/201310_CentralisedDatasetFinal/CentralisedDataset/HalfHourly/Auxiliaries/UltraEdit/UltraEditManual.pdf)).

---

## Confirmed Default Chord

The only default multi-key chord confirmed in current official UltraEdit documentation is:

| Chord | Command | Description |
|-------|---------|-------------|
| **Ctrl+P, Ctrl+S** | Persistent selection | Begins persistent selection mode — move the caret anywhere in the file to create a selection without holding Shift. Press the chord again to exit. |

Source: [UltraEdit Wiki — Persistent selection](https://wiki.ultraedit.com/Persistent_selection), [UltraEdit Wiki — Keyboard shortcuts](https://wiki.ultraedit.com/Keyboard_shortcuts)

**How the delay interacts:** `Ctrl+P` is by default mapped to Print and `Ctrl+S` to Save. When you press `Ctrl+P`, UltraEdit pauses for the multi-key delay. If you press `Ctrl+S` within that window, persistent selection activates. If the delay expires first, the Print dialog opens normally.

---

## Documented Chord Examples (Configure Manually)

These chord examples appear in official UltraEdit documentation as illustrations of what you **can** set up. They are not shipped defaults — you must assign them yourself via Key Mapping.

| Chord | Command Name | Action | Source |
|-------|-------------|--------|--------|
| **Ctrl+R, M** | `FileOpenFileUnderCursor` | Opens the file whose name is under the cursor | [UltraEdit Tutorials — Keymapping](https://www.ultraedit.com/support/tutorials-power-tips/uestudio/keymapping/) |
| **Ctrl+B, Ctrl+M** | (Toggle Bookmark example) | Toggles a bookmark at the current line | [UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping) |

**Note on Ctrl+R, M:** `Ctrl+R` is by default the Replace command. If you assign `Ctrl+R, M` to `FileOpenFileUnderCursor`, pressing `Ctrl+R` alone will still open the Replace dialog — but only after the multi-key delay expires. This introduces a slight lag before Replace activates. To avoid this, choose a first key that is not already mapped to a frequently used command ([UltraEdit Forums — Opening include files](https://forums.ultraedit.com/opening-include-files-t12371.html)).

**Note on FileOpenFileUnderCursor:** This command can also be triggered by right-clicking at the cursor position and selecting the first context-menu item (which shows the detected filename). It works when UltraEdit can detect the string under the cursor as a filename and locate the file on disk ([UltraEdit Forums — Opening include files](https://forums.ultraedit.com/opening-include-files-t12371.html)).

---

## Configuring a Custom Chord — Step by Step

### Opening the Key Mapping Dialog

| UltraEdit Version | Menu Path |
|-------------------|-----------|
| Current documentation wording | **Settings → Key mapping** |
| Legacy / Classic menus | **Advanced → Configuration → Key Mapping** |
| Linux | **Edit → Preferences → Key Mapping** |

Sources: [UltraEdit Wiki — Keyboard shortcuts](https://wiki.ultraedit.com/Keyboard_shortcuts), [UltraEdit — Linux keyboard shortcuts](https://www.ultraedit.com/support/tutorials-power-tips/ultraedit/linux/keyboard-shortcuts/)

### Assigning a Chord

1. **Open** the Key Mapping dialog via the path above.
2. **Select a command** from the alphabetically sorted **Commands** list. Its current key assignment (if any) appears in the **Existing keys** combo box, and a description appears in the **Description** field at the bottom.
3. **Click inside the first text field** under **Press new (multi-)key** to give it focus (or press Tab to reach it).
4. **Press the first key combination** (e.g., `Ctrl+R`). The combination is captured and displayed in the first field. You may use up to three keys per field (e.g., `Ctrl+Shift+T`).
5. **Click inside the second text field** under **Press new (multi-)key**.
6. **Press the second key combination** (e.g., `M`). The second part is captured and displayed.
7. **Click the Assign button.** If the key combination is already assigned to another command, UltraEdit asks whether to delete the existing assignment and replace it.
8. **Click OK** to close the dialog. The chord is now active.

Source: [UltraEdit Tutorials — Keymapping](https://www.ultraedit.com/support/tutorials-power-tips/uestudio/keymapping/), [UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping)

### Removing a Chord

1. Select the command from the **Commands** list.
2. Select the existing key assignment from the **Existing keys** combo box.
3. Click the **Remove** button.

### Resetting All Shortcuts to Defaults

Click the **Defaults** button. You will be prompted to confirm. All keyboard shortcuts are reset to factory defaults ([UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping)).

### Exporting Your Key Mappings

Click the **Show Key Mapping in Editor** button. UltraEdit generates a plain-text file (named `[Editor Name].shortcuts.txt`) containing all currently configured shortcuts — standard key mappings, menu shortcuts, and macro hotkeys. Use the **Sort by Keys** or **Sort by IDs** toggle to control ordering. This file can be printed as a quick reference ([UltraEdit Tutorials — Keymapping](https://www.ultraedit.com/support/tutorials-power-tips/uestudio/keymapping/)).

### Tab Key Behavior in the Key Field

If the Tab-focus option is enabled in Key Mapping settings, pressing Tab while focus is on the **Press new (multi-)key** entry field moves focus out of the field instead of assigning Tab as part of the shortcut. This option can be toggled in the Key Mapping dialog ([UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping)).

---

## Multi-Key Delay Settings

The **Multi-key delay** controls how long UltraEdit waits for the second key of a chord before falling back to the first key's normal action.

| Setting | Details |
|---------|---------|
| **Field name** | Multi-key delay |
| **Location** | Key Mapping dialog (same panel as Press new (multi-)key) |
| **Unit** | Milliseconds (ms) |
| **Behavior** | If the second key is pressed within the delay → chord action fires. If the delay expires → the first key's own mapped action fires instead. |
| **Default value** | Not explicitly documented by UltraEdit |
| **Adjustment** | Increase the value to give yourself more time between keystrokes; decrease it to reduce lag when you press only the first key. |

Source: [UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping)

**Choosing a delay value:**

| Scenario | Suggested Range |
|----------|----------------|
| Fast typist, short chords | 300–500 ms |
| Moderate pace | 500–800 ms |
| Deliberate / two-hand chords | 800–1200 ms |

These are unofficial starting points — UltraEdit does not publish an official recommended range. Start with a moderate value and adjust based on whether chords fire reliably or the first key's action triggers too often.

---

## Key Mapping File Management

| Item | Details |
|------|---------|
| **File location** | Same directory as the UltraEdit INI file |
| **Default path (UltraEdit)** | `%APPDATA%\IDMComp\UltraEdit` |
| **Default path (UEStudio)** | `%APPDATA%\IDMComp\UEStudio` |
| **Filename (UltraEdit 32-bit)** | `Uedit32.uek` |
| **Filename (UltraEdit 64-bit)** | `Uedit64.uek` |
| **Filename (UEStudio)** | `UEStudio.uek` |
| **Legacy extension** | `.kbd` (e.g., `uedit32.kbd`) — used before UltraEdit v12.20 / UEStudio v06.00 |
| **Loaded at startup** | Yes — the editor searches for this file when it launches |

Source: [UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping), [UltraEdit Tutorials — Keymapping](https://www.ultraedit.com/support/tutorials-power-tips/uestudio/keymapping/)

**Backup tip:** Copy the `.uek` file to a safe location after customizing your chords. To restore, place the backup file back in the INI directory before launching UltraEdit.

---

## Suggested Custom Chord Workflows

These are practical chord mappings you can configure for common editing and navigation tasks. Each uses real UltraEdit command names from the Commands list. None of these are defaults — assign them via Key Mapping.

### Text Editing

| Chord | Command Name | Action | Why Use a Chord |
|-------|-------------|--------|-----------------|
| Ctrl+R, M | `FileOpenFileUnderCursor` | Open the file under the cursor | Documented example from UltraEdit tutorials — opens include files, configs, or paths instantly |
| Ctrl+B, Ctrl+M | Toggle Bookmark | Toggle bookmark on current line | Wiki-documented example — keeps Ctrl+F2 free for other uses |
| Ctrl+E, D | Delete Line | Delete the line at the cursor | Frees up the single-key Ctrl+E if you prefer it for something else |
| Ctrl+T, C | Trim Trailing Spaces | Remove trailing whitespace from all lines | Quick cleanup without navigating menus |
| Ctrl+T, L | Trim Leading Spaces | Remove leading whitespace from all lines | Pairs with the above for whitespace management |
| Ctrl+W, C | Column Mode | Toggle column/block editing mode | Keeps Alt+C available; chord is more mnemonic ("Wrap Column") |

### Navigation

| Chord | Command Name | Action | Why Use a Chord |
|-------|-------------|--------|-----------------|
| Ctrl+G, L | Goto | Open the Goto Line dialog | Frees up the single-key Ctrl+G if reassigned |
| Ctrl+G, B | Select to Matching Brace | Jump to matching bracket | Mnemonic: "Goto Brace" |
| Ctrl+F2, N | Go to Bookmark | Jump to next bookmark | Separates toggle (Ctrl+F2) from navigation |
| Ctrl+F6, P | Previous Window | Switch to previous file tab | Complements the default Ctrl+Shift+F6 |
| Ctrl+Space, A | Auto-complete | Open auto-complete dialog | Keeps Ctrl+Space free for other uses if needed |
| Ctrl+F, W | Select Next Occurrence | Select the next occurrence of the word under the cursor | Quick multi-select without opening the Find dialog |

### Search and Replace

| Chord | Command Name | Action | Why Use a Chord |
|-------|-------------|--------|-----------------|
| Ctrl+R, F | Find | Open the Find dialog | "Replace Find" mnemonic — pairs Replace and Find on same prefix |
| Ctrl+F, I | Find in Files | Search across multiple files | Quick multi-file search from a chord |
| Ctrl+R, R | Replace | Open the Replace dialog (reassign from single key) | If you move Replace off Ctrl+R to free it for chords |
| Ctrl+., H | Highlight All | Highlight all occurrences of selected text | Quick visual scanning |

---

## Troubleshooting

### Chord Does Nothing

- Verify the chord is assigned: open Key Mapping, select the command, check the **Existing keys** field.
- Check that the **multi-key delay** is long enough — if it is too short, the second key may not register in time.
- Ensure no other application is intercepting the keystroke (e.g., a global hotkey utility or Windows shortcut).

### First Key Triggers Another Command

- This happens when the first key is already mapped to a command (e.g., `Ctrl+R` = Replace). After the multi-key delay expires, the first key's action fires.
- **Fix:** Increase the multi-key delay to give yourself more time, or choose a first key that is not already assigned.
- **Alternative:** Use a modifier-rich first key like `Ctrl+Shift+R` that is less likely to conflict.

### Second Key Not Recognized

- Make sure you clicked in the **second** text field before pressing the second key during configuration.
- Check whether the Tab-focus option is enabled — if so, pressing Tab as part of a chord will move focus instead of registering the key.

### Chord Works Intermittently

- The multi-key delay is likely too short for your typing speed. Increase it by 200–300 ms and test again.
- If using a remote desktop or VM, network latency may consume part of the delay window. Increase the delay accordingly.

### Conflicts with Windows or Application Shortcuts

- Windows global shortcuts (e.g., `Win+D`, `Alt+Tab`) take priority over UltraEdit chords. Avoid using the Windows key as part of a chord.
- If another running application has registered a global hotkey that matches your chord's first key, the application may intercept it before UltraEdit sees it.

### Resetting After Experimentation

- Click the **Defaults** button in Key Mapping to restore all factory shortcuts.
- Back up your `.uek` file before making bulk changes so you can revert without losing your customizations.

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────┐
│           ULTRAEDIT MULTI-KEY CHORDS — QUICK CARD        │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  DEFAULT CHORD (confirmed in docs):                               │
│  Ctrl+P, Ctrl+S  →  Persistent Selection                │
│                                                         │
│  DOCUMENTED EXAMPLES (assign manually):                 │
│  Ctrl+R, M       →  Open File Under Cursor              │
│  Ctrl+B, Ctrl+M  →  Toggle Bookmark                     │
│                                                         │
│  CONFIGURE:                                             │
│  Settings → Key Mapping (or Advanced → Configuration)   │
│  Select command → Press new (multi-)key field 1         │
│  Press first combo → Click field 2 → Press second combo │
│  Click Assign → OK                                      │
│                                                         │
│  MULTI-KEY DELAY:                                        │
│  Set in ms in Key Mapping dialog                        │
│  Too short = chord fails; too long = first key lags    │
│  Suggested: 500–800 ms                                  │
│                                                         │
│  EXPORT SHORTCUTS:                                       │
│  Click "Show Key Mapping in Editor" button              │
│  → Generates [Editor].shortcuts.txt                     │
│                                                         │
│  KEY FILE:                                               │
│  %APPDATA%\IDMComp\UltraEdit\Uedit64.uek                │
│  Back up this file after customizing                    │
│                                                         │
│  RESET ALL: Defaults button in Key Mapping              │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## Sources

- [UltraEdit Wiki — Settings: Key mapping](https://wiki.ultraedit.com/Settings:Key_mapping)
- [UltraEdit Wiki — Keyboard shortcuts](https://wiki.ultraedit.com/Keyboard_shortcuts)
- [UltraEdit Wiki — Persistent selection](https://wiki.ultraedit.com/Persistent_selection)
- [UltraEdit Tutorials — Configure custom keymapping and menu hotkeys](https://www.ultraedit.com/support/tutorials-power-tips/uestudio/keymapping/)
- [UltraEdit Forums — Opening include files (FileOpenFileUnderCursor)](https://forums.ultraedit.com/opening-include-files-t12371.html)
- [UltraEdit Forums — How to open a selected file name or file name under cursor](https://forums.ultraedit.com/how-to-open-a-selected-file-name-or-file-name-unde-t6549.html)
- [UltraEdit — Linux keyboard shortcuts](https://www.ultraedit.com/support/tutorials-power-tips/ultraedit/linux/keyboard-shortcuts/)
- [UltraEdit — Keyboard Shortcuts Guide (Windows)](https://www.ultraedit.com/support/tutorials-power-tips/ultraedit/keyboard-shortcuts/)
