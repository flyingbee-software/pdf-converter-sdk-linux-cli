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
*   **Multi-Threaded Batch PDF Conversion Linux:** Accelerate processing on your Linux server PDF converter by utilizing up to 10 concurrent threads (`-t 1-10`).
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
5.  Execute a basic conversion command (convert a PDF to Word):
    ```bash
    ./FPPDFConverter.out -a PDF2Files -i "Test.pdf" -f docx -p all -o "Test.docx"
    ```

## Command Line Reference

Every invocation starts with an application command:

```bash
./FPPDFConverter.out -a <command> [options]
```

Run `./FPPDFConverter.out -h` for app-level help, or `./FPPDFConverter.out -a <command> -h` for options specific to a command. Available commands:

| Command | Description |
| :--- | :--- |
| `PDF2Files` | Convert PDF documents to Word, Excel, PPT, HTML, images, etc. |
| `Images2PDF` | Merge multiple images into a single PDF document. |
| `Text2Word` | Convert plain text files to formatted Word documents. |

> **Note:** Short flags are reused across commands with **different meanings** (e.g. `-z` means "package HTML to ZIP" under `PDF2Files`, but "scale mode" under `Images2PDF`). Always refer to the section for the command you are using.

### Global Options (All Commands)

| Option | Description |
| :--- | :--- |
| `-h` | Show this help message and exit. |
| `-c` | Open the converted file automatically upon completion. |

### PDF2Files — PDF to Word / Excel / PPT / HTML / Images

```bash
./FPPDFConverter.out -a PDF2Files -i <input.pdf> -o <output> [options]
```

| Option | Description |
| :--- | :--- |
| `-i <path>` | Input PDF file path (required). |
| `-o <path>` | Output file or directory path (required). |
| `-f <format>` | Target format: `docx` (default), `pptx`, `xlsx`, `html`, `csv`, `txt`, `jpeg`, `jpg`, `png`, `bmp`, `tif`, `tiff`, `gif`. |
| `-p <ranges>` | Page ranges to convert, e.g. `1-3,5,8-10`. |
| `-t <threads>` | Number of processing threads (1-10, default: 1). |
| `-x` | (XLSX only) Merge multiple sheets into a single sheet. |
| `-w <password>` | Password for opening encrypted PDF files. |

**HTML output options:**

| Option | Description |
| :--- | :--- |
| `-l <mode>` | Layout mode: `0` = exact page layout (default), `1` = text flow. |
| `-e <mode>` | Paragraph style: `0` = line break (default), `1` = indent. |
| `-b <mode>` | Navigation bar: `0` = disabled, `1` = enabled (default). |
| `-m <level>` | Resource merge: `0` = none (default), `1` = CSS/JS, `2` = CSS/JS/small images, `3` = CSS/JS/all images. |
| `-z` | Package the HTML output and its resources as a ZIP file. |

**Image output options (`jpeg`, `jpg`, `png`, `bmp`, `tif`, `tiff`, `gif`):**

| Option | Description |
| :--- | :--- |
| `-d <dpi>` | Image resolution (72-600, default: 144). |
| `-n <mode>` | Anti-aliasing: `0` = none, `1` = font smoothing (default). |

**OCR options:**

| Option | Description |
| :--- | :--- |
| `-r` | Enable OCR (Optical Character Recognition). |
| `-g <lang>` | OCR language for Tesseract, e.g. `eng`, `chi_sim`, `jpn`. |

### Images2PDF — Merge Images to PDF

```bash
./FPPDFConverter.out -a Images2PDF -i <folder> -o <output.pdf> [options]
```

| Option | Description |
| :--- | :--- |
| `-i <folder>` | Source folder containing images (required). |
| `-o <path>` | Output PDF file path (required). |
| `-s <size>` | Paper size: `A0`-`A10`, `Letter`, `Legal`, `Tabloid`, `4x6`, `5x7`, or `auto` (default: none). |
| `-n <orient>` | Orientation: `portrait`, `landscape`, `auto` (default: auto). |
| `-w <inches>` | Custom paper width in inches (used with a custom size). |
| `-l <inches>` | Custom paper height in inches (used with a custom size). |
| `-m <margin>` | Page margins in inches; append `mm` for millimeters. |
| `-z <scale>` | Scale mode: `fit` (default), `fw`, `fh`, `reduce`, `rw`, `rh`, `none`. |
| `-r <crop>` | Crop/expand: `none` (default), `height`, `width`, `both`. |

**Metadata options:**

| Option | Description |
| :--- | :--- |
| `-t <title>` | Document title. |
| `-A <author>` | Document author. |
| `-k <keywords>` | Document keywords. |
| `-S <subject>` | Document subject. |
| `-C <creator>` | Document creator. |

### Text2Word — Plain Text to Word

```bash
./FPPDFConverter.out -a Text2Word -i <input.txt> -o <output.docx> [options]
```

| Option | Description |
| :--- | :--- |
| `-i <path>` | Input plain text file path (required). |
| `-o <path>` | Output Word document path (required). |
| `-s <size>` | Paper size: `A0`-`A10`, `Letter`, `Legal`, `Tabloid`, `4x6`, `5x7`, or `auto` (default: none). |
| `-n <orient>` | Orientation: `portrait`, `landscape`, `auto` (default: auto). |
| `-w <inches>` | Custom paper width in inches (used with a custom size). |
| `-l <inches>` | Custom paper height in inches (used with a custom size). |
| `-m <margin>` | Page margins in inches; append `mm` for millimeters. |
| `-e <columns>` | Number of columns (1-10, default: 1). |
| `-b <font>` | Font name: `Arial` (default), `Calibri`, `Courier`, `Times New Roman`, `Helvetica`, `Verdana`, `Consolas`, `SimSun`, `SimHei`, `FangSong`, `KaiTi`, `Microsoft YaHei`. |
| `-d <size>` | Font size in points (8-72, default: 12). |

## Usage Examples

**Convert a PDF to Word (default format, all pages):**
```bash
./FPPDFConverter.out -a PDF2Files -i "/documents/report.pdf" -o "/output/report.docx"
```

**Convert a PDF to Word with specific pages:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/documents/report.pdf" -f docx -p "1-3,5,8-10" -o "/output/report.docx"
```

**Convert a PDF to Excel with merged sheets using 4 threads:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/data/invoice.pdf" -f xlsx -x -t 4 -o "/exports/invoice.xlsx"
```

**Convert a password-protected PDF to PowerPoint:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/secure/presentation.pdf" -f pptx -w "MySecretPass" -o "/slides/presentation.pptx"
```

**Convert selected pages of a PDF to 300 DPI PNG images:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/scans/book.pdf" -f png -d 300 -p "1-10" -o "/images/book_"
```

**Convert a PDF to a single HTML page and package it as a ZIP:**
```bash
./FPPDFConverter.out -a PDF2Files -i "/manuals/guide.pdf" -f html -l 0 -z -o "/web/guide.zip"
```

**Convert a scanned PDF to a searchable DOCX using OCR (Simplified Chinese):**
```bash
./FPPDFConverter.out -a PDF2Files -i "/scans/contract.pdf" -f docx -r -g chi_sim -o "/output/contract.docx"
```

**Convert a directory of images to a single PDF (A4, landscape):**
```bash
./FPPDFConverter.out -a Images2PDF -i "/images/folder/" -s A4 -n landscape -o "/archives/combined.pdf"
```

**Convert plain text to a Word document with font and size settings:**
```bash
./FPPDFConverter.out -a Text2Word -i "/notes/readme.txt" -b SimSun -d 14 -o "/docs/readme.docx"
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
The `-t` flag accepts values from 1 to 10 for the `PDF2Files` command (default: 1). Setting it to 10 maximizes throughput on high-core-count servers, but ensure your system has sufficient RAM and CPU resources.

**5. How can I see all available options?**
Run `./FPPDFConverter.out -h` for the list of commands, or `./FPPDFConverter.out -a <command> -h` (e.g. `./FPPDFConverter.out -a PDF2Files -h`) for command-specific options.

**6. Why is my conversion failing with path errors?**
Ensure you are using forward slashes (`/`) for all file paths and avoid Windows-specific illegal characters (like `\` or `:`) in your file and directory names.

**7. Does the SDK preserve hyperlinks and tables?**
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
