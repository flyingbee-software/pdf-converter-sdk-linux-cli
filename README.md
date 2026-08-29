# PDF to Word, Excel & PowerPoint Conversion SDK for Linux Server (CLI)

Flyingbee PDF Converter for Linux is a high-performance, headless PDF converter designed for enterprise server environments. This Linux PDF conversion SDK provides a robust command-line interface (CLI) to seamlessly transform PDF documents into editable Microsoft Office formats. Whether you need a reliable PDF to Word Linux CLI tool, a PDF to Excel command line utility, or a PDF to PowerPoint Linux solution, this library preserves original layouts, text, images, tables, hyperlinks, and Bezier graphics with exceptional accuracy.

![FPPDFConverter Console Preview](https://www.flyingbee.com/pdf-converter/images/FPPDFConverter-Console.jpg)

---

## 🕹️Try It Online

Want to try before deploying? Use the **Flyingbee PDF Converter Online** to convert PDFs to MS Office formats directly in your browser — no installation required.

[🚀 Launch Web Demo](https://www.flyingbee.com/pdf-converter/?utm_source=github_readme_conversion_sdk_linux_cli&utm_medium=referral&utm_campaign=github_readme_conversion_sdk_linux_cli)

---

## Features

*   **High-Fidelity PDF2Files Linux Conversion:** Accurately converts PDFs to Word (.docx), Excel (.xlsx), and PowerPoint (.pptx) while maintaining the original document structure.
*   **Versatile Conversion Modes:** Supports multiple workflows including `PDF2Files`, `Images2PDF` command line processing, and `Text2Word` Linux operations.
*   **Multi-Threaded Batch PDF Conversion Linux:** Accelerate processing on your Linux server PDF converter by utilizing up to 12 concurrent threads.
*   **Comprehensive Format Support:** Export to `docx`, `pptx`, `xlsx`, `csv`, `txt`, `jpeg`, `jpg`, `png`, `bmp`, `tif`, `tiff`, and `gif`.
*   **Advanced PDF Handling:** Includes options for password-protected files, custom page ranges, adjustable image DPI (72-600), and merged Excel sheets.
*   **Headless PDF Converter Architecture:** Designed specifically for automated, server-side workflows without requiring a graphical user interface.

## System Requirements

*   **Operating System:** Linux (Compatible with major distributions including Ubuntu, CentOS, Debian, and Red Hat)
*   **Architecture:** x86， 64-bit (x86_64)， arm64
*   **Required Fonts:** For optimal rendering and conversion accuracy, ensure the following fonts are installed in `/usr/share/fonts` or `~/.fonts`:
    *   Arial
    *   Consolas
    *   Courier
    *   Times New Roman
*   **File Path Rules:** Always use forward slashes (`/`) for paths. Avoid Windows illegal characters in file and directory names.

## Quick Start

Follow these steps to deploy and execute the PDF conversion library Linux CLI on your server:

1.  Upload the SDK package to your Linux server (using tools like WinSCP or SCP).
2.  Open your terminal and navigate to the directory containing the executable:
    ```bash
    cd /path/to/pdf-converter-sdk-Linux-cli
    ```
3.  According to your server CPU architecture, modify one of them to the name FPPDFConverter.out， such as:
    ```bash
    mv "FPPDFConverter-x64.out" "FPPDFConverter.out"
    ```
4.  Grant execution permissions to the binary:
    ```bash
    chmod +x FPPDFConverter.out
    ```
5.  Execute a basic conversion command:
    ```bash
    ./FPPDFConverter.out -a PDF2Files -i "Test.pdf" -f docx -p all
    ```

## Command Line Reference

| Flag | Parameter | Description |
| :--- | :--- | :--- |
| `-a` | App Name | Specifies the application mode: `PDF2Files`, `Images2PDF`, or `Text2Word` |
| `-i` | Input Path | Path to the input file or directory |
| `-o` | Output Path | Destination path for the converted files |
| `-f` | Format | Target format: `docx`, `pptx`, `xlsx`, `csv`, `txt`, `jpeg`, `jpg`, `png`, `bmp`, `tif`, `tiff`, `gif` |
| `-p` | Page Range | Pages to convert (e.g., `all`, `1-5`, `1,3,5`) |
| `-t` | Threads | Number of concurrent threads (0-12). Default is 1. |
| `-d` | DPI | Image resolution for exports, ranging from 72 to 600 |
| `-w` | Password | Password for opening encrypted PDF files |
| `-x` | Merge Sheets | Merges multiple PDF pages into a single Excel sheet (for xlsx) |
| `-c` | Open File | Automatically opens the converted file upon completion |
| `-h` | Help | Displays the help menu and available commands |

## Usage Examples

**Convert a PDF to Word with specific pages:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/documents/report.pdf" -f docx -p "1-10" -o "/output/"
```

**Convert a PDF to Excel with merged sheets using 4 threads:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/data/invoice.pdf" -f xlsx -x -t 4 -o "/exports/"
```

**Convert a password-protected PDF to PowerPoint at 300 DPI:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/secure/presentation.pdf" -f pptx -w "MySecretPass" -d 300 -o "/slides/"
```

**Convert a directory of images to a single PDF:**
```bash
./FPPDFConverter.out -a Images2PDF -i "/images/folder/" -f pdf -o "/archives/combined.pdf"
```

**Convert plain text to a Word document:**
```bash
./FPPDFConverter.out -a Text2Word -i "/notes/readme.txt" -f docx -o "/docs/"
```

## Batch Conversion

For large-scale operations, utilize the included batch converter script to automate processing across multiple files or directories. The script leverages the underlying `PDF2Files Linux` engine to iterate through source directories, apply consistent conversion parameters, and output results to a designated target folder. This is ideal for integrating into CI/CD pipelines, cron jobs, or custom shell scripts for automated document processing.

## FAQ

**1. How do I check my remaining trial license time?**
When running the trial version, the console will display a "Time of license remaining" message during execution. Once the trial expires, a valid license is required for continued use.

**2. Why are my converted documents missing fonts or formatting?**
Linux environments do not include Microsoft fonts by default. Ensure Arial, Consolas, Courier, and Times New Roman are installed in `/usr/share/fonts` or `~/.fonts` and refresh the font cache.

**3. Can I use this SDK on a headless server without a GUI?**
Yes, this is a dedicated headless PDF converter designed specifically for Linux server environments and automated backend workflows.

**4. What is the maximum number of threads I can use?**
The `-t` flag supports values from 0 to 12. Setting it to 12 maximizes throughput on high-core-count servers, but ensure your system has sufficient RAM and CPU resources.

**5. Why is my conversion failing with path errors?**
Ensure you are using forward slashes (`/`) for all file paths and avoid Windows-specific illegal characters (like `\` or `:`) in your file and directory names.

**6. Does the SDK preserve hyperlinks and tables?**
Yes, the PDF conversion library Linux engine is designed to retain original text, images, layouts, hyperlinks, tables, and Bezier graphics during the conversion process.

## Release Notes

| Version | Release Date | Notes |
| :--- | :--- | :--- |
| v10.3.6 | 2026-08-28 | Release on GitHub |
| v2.0.2.0 | 2025-09-30 | Latest stable release with enhanced conversion fidelity |
| v1.6.8.0 | 2024-08-24 | Previous stable release |

## Support

For technical assistance, licensing inquiries, or bug reports, please reach out to the Flyingbee team:

*   **Email:** [support@flyingbee.com](mailto:support@flyingbee.com)
*   **Contact Page:** [https://www.flyingbee.com/contact-us/](https://www.flyingbee.com/contact-us/?utm_source=github_readme_conversion_sdk_linux_cli&utm_medium=referral&utm_campaign=github_readme_conversion_sdk_linux_cli)
