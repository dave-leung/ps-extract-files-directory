# Recursive Zip Extraction Script

## Description

This PowerShell script (`main.ps1`) recursively searches a source directory (`$srcPath`) for `.zip` files and extracts them to a destination directory (`$destPath`).  It handles nested directories within the source path, ensuring all zip files within are extracted.

## Prerequisites

* **PowerShell:** This script requires PowerShell 3.0 or later.
* **Permissions:** Ensure you have read and write permissions to both the source and destination directories.

## Usage

1.  **Clone or download the script:** Obtain the `main.ps1` file from this repository.
2.  **Modify Variables:**  **Important:**  Before running the script, you *must* modify the `$srcPath` and `$destPath` variables within the script to point to your desired source and destination directories.  See the "Configuration" section below for details.
3.  **Run the script:** Open PowerShell and navigate to the directory containing `Extract-Zips.ps1`.  Then execute the script using:

    ```powershell
    .\main.ps1
    ```

## Configuration

The script uses the following variables for configuration:

*   **`$srcPath`**:  The root directory to recursively search for `.zip` files.  **This is the directory where the script will *start* looking for zip files.**  Ensure this is a fully qualified path.
    *   **Example:** `$srcPath = "C:\SourceFolder"`
*   **`$destPath`**: The root directory where the extracted files will be placed. **Extracted contents will maintain the original directory structure within the zip file, relative to the root of the zip.** Ensure this is a fully qualified path.
    *   **Example:** `$destPath = "D:\DestinationFolder"`

**To change these variables, open `main.ps1` in a text editor and modify the lines defining these variables.**  Make sure to save the file after making changes.
