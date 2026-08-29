# ============ Bash Script: Convert All PDFs to DOCX/PPTX/XLSX/HTML/CSV/TXT ============
#!/bin/bash

# ============ Configuration Section (Please modify according to your setup) ============
PDF_DIR="./"                                   # Directory containing PDF files, "./" means current directory
OUTPUT_DIR="converted"                         # Directory for converted files
TOOL_PATH="./FPPDFConverter.out"
NUM_THREADS="4"                           # Number of threads (1 - 12)
OUTPUT_FORMAT="docx"                           # Output format (can be changed to pptx, xlsx, html, csv, txt, etc.)
LOG_FILE="conversion.log"
SUCCESS_MARKER="Successfully converted!"
# ==============================================
echo "========================================"
cd "$PDF_DIR" || { echo "❌ Failed to enter directory: $PDF_DIR"; exit 1; }

# Initialize log
echo "📄 PDF to $OUTPUT_FORMAT Conversion Log" > "$LOG_FILE"
echo "📅 Started at: $(date)" >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Create output directory and clean old files
mkdir -p "$OUTPUT_DIR"
rm -f "$OUTPUT_DIR"/*."$OUTPUT_FORMAT"
echo "✅ Cleaned up existing .$OUTPUT_FORMAT files."

# Gather PDFs
pdf_files=(*.pdf)
if [[ ! -f "${pdf_files[0]}" ]]; then
    echo "⚠️ No PDF files found."
    echo "⚠️ No PDF files found." >> "$LOG_FILE"
    exit 0
fi

# Keep only valid PDFs: verify the "%PDF" magic header so files that merely
# carry a .pdf name (empty files, Git LFS pointers, etc.) are skipped.
valid_pdfs=()
skipped_count=0
for f in "${pdf_files[@]}"; do
    if [[ -f "$f" && "$(head -c 4 "$f" 2>/dev/null)" == "%PDF" ]]; then
        valid_pdfs+=("$f")
    else
        echo "⚠️ Skipping invalid PDF file: $f"
        echo "⚠️ Skipping invalid PDF file: $f" >> "$LOG_FILE"
        ((skipped_count++))
    fi
done

if (( ${#valid_pdfs[@]} == 0 )); then
    echo "⚠️ No valid PDF files found (all *.pdf files failed the %PDF check)."
    echo "⚠️ No valid PDF files found (all *.pdf files failed the %PDF check)." >> "$LOG_FILE"
    exit 0
fi

total=${#valid_pdfs[@]}
echo "📦 Found $total valid PDF file(s). Starting conversion..."
echo "📦 Found $total valid PDF file(s)." >> "$LOG_FILE"
if (( skipped_count > 0 )); then
    echo "⚠️ Skipped $skipped_count invalid file(s)."
    echo "⚠️ Skipped $skipped_count invalid file(s)." >> "$LOG_FILE"
fi

# --- Time ---
success_count=0
fail_count=0

# --- Start total timer ---
start_total=$(date +%s)

# --- Conversion Loop ---
for i in "${!valid_pdfs[@]}"; do
    pdf_file="${valid_pdfs[$i]}"
    index=$((i + 1))
	message="------------------"
    echo "$message"
    echo "$message" >> "$LOG_FILE"

    message="【$pdf_file】"
    echo "$message"
    echo "$message" >> "$LOG_FILE"

    message="🔄 Converting($index/$total)..."
    echo "$message"
    echo "$message" >> "$LOG_FILE"

    start_file=$(date +%s)
    separator="--------------------------------------------------------------------------------"
    echo "$separator" >> "$LOG_FILE"

    # Run command and capture output
    # NOTE: -o expects a full output file path (the SDK treats it as a file name),
    # so pass "converted/<name>.<format>" rather than just the directory.
    out_path="$OUTPUT_DIR/${pdf_file%.*}.${OUTPUT_FORMAT}"
    output=$( "$TOOL_PATH" -a PDF2Files -i "$pdf_file" -f "$OUTPUT_FORMAT" -o "$out_path" -t "$NUM_THREADS" -p all 2>&1 )
    echo "$output" >> "$LOG_FILE"

    # Check for success message
    if echo "$output" | grep -q "$SUCCESS_MARKER"; then
        end_file=$(date +%s)
        duration=$((end_file - start_file))
        echo "✅ Succeeded ($duration s)"
        echo "✅ Succeeded in $duration seconds." >> "$LOG_FILE"
        ((success_count++))
    else
        end_file=$(date +%s)
        duration=$((end_file - start_file))
        echo "❌ Failed ($duration s)"
        echo "❌ Failed: '$SUCCESS_MARKER' not found." >> "$LOG_FILE"
        echo "➡️  Output preview:" >> "$LOG_FILE"
        echo "$output" | head -n 3 >> "$LOG_FILE"
        ((fail_count++))
    fi

    echo "" >> "$LOG_FILE"  # blank line
done

# --- Total time ---
end_total=$(date +%s)
duration_total=$((end_total - start_total))
minutes=$((duration_total / 60))
seconds=$((duration_total % 60))

# --- Final Summary ---
echo ""
    echo "【FINAL SUMMARY】"
echo "------------------------"
echo "✅ $success_count succeeded"
echo "❌ $fail_count failed"
echo "📤 $total total"

if (( duration_total >= 60 )); then
    printf "⏱️ Total time: %dm %ds" "$minutes" "$seconds"
else
    echo "⏱️ Total time: ${duration_total}s"
fi

# 🎉 Final completion message
if (( fail_count == 0 && total > 0 )); then
    echo "🎉 All conversions completed successfully!"
elif (( success_count > 0 )); then
    echo "⚠️ Some conversions failed, check $LOG_FILE for details."
else
    echo "💥 All conversions failed!"
fi
	echo "------------------"
    echo ""

# --- Write summary to log ---
{
    echo ""
    echo "【FINAL SUMMARY】"
    echo "---------------"
    echo "✅ $success_count succeeded"
    echo "❌ $fail_count failed"
    echo "📤 $total total"
    echo "⏱️ Total time: $((duration_total / 60))m $((duration_total % 60))s"
    echo "📅 Finished at: $(date)"
	echo "------------------"
    echo ""
} >> "$LOG_FILE"
