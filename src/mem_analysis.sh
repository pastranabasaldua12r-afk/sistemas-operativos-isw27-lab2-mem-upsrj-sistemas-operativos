#!/bin/bash
###############################################################################
# File: mem_analysis.sh
# Author (GitHub): pastranabasaldua12r-afk
# Subject: Operating Systems
# Topic: Memory Management Analysis in Linux (Ubuntu 22.04)
#
# Description:
# This script must collect memory-related information from a Linux system
# and store both command outputs and student analysis in a log file.
#
# IMPORTANT:
# - Students must complete the missing commands.
# - Do NOT modify system parameters.
# - Do NOT require user interaction.
# - All analysis must be written using echo statements.
###############################################################################

# -----------------------------------------------------------------------------
# Output configuration
# -----------------------------------------------------------------------------
OUT_DIR="../out"
LOG_FILE="${OUT_DIR}/mem_analysis.log"

mkdir -p "${OUT_DIR}"
: > "${LOG_FILE}"

###############################################################################
# Student identification
###############################################################################

GITHUB_USER="pastranabasaldua12r-afk"

###############################################################################
echo "================ MEMORY MANAGEMENT ANALYSIS =================" >> "${LOG_FILE}"
echo "Author (GitHub): ${GITHUB_USER}" >> "${LOG_FILE}"
echo "System: Ubuntu 22.04" >> "${LOG_FILE}"
echo "Date: $(date)" >> "${LOG_FILE}"
echo "=============================================================" >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 1: General Memory Status
###############################################################################
echo "=== SECTION 1: GENERAL MEMORY STATUS ===" >> "${LOG_FILE}"

free -h >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "The system RAM information is displayed above." >> "${LOG_FILE}"
echo "Used memory represents memory currently allocated to running processes." >> "${LOG_FILE}"
echo "Free memory is completely unused RAM." >> "${LOG_FILE}"
echo "Available memory includes reclaimable cache and buffers." >> "${LOG_FILE}"
echo "Swap may be used even if free RAM exists due to kernel memory optimization." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 2: Memory Status Over Time
###############################################################################
echo "=== SECTION 2: MEMORY STATUS OVER TIME ===" >> "${LOG_FILE}"

vmstat 1 5 >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "Swap-in (si) indicates data moved from disk to RAM." >> "${LOG_FILE}"
echo "Swap-out (so) indicates data moved from RAM to disk." >> "${LOG_FILE}"
echo "If si and so values are zero, no active paging is occurring." >> "${LOG_FILE}"
echo "Excessive paging reduces performance due to heavy disk usage." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 3: Kernel Memory Information
###############################################################################
echo "=== SECTION 3: KERNEL MEMORY INFORMATION ===" >> "${LOG_FILE}"

cat /proc/meminfo >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "MemFree shows completely unused memory." >> "${LOG_FILE}"
echo "MemAvailable estimates memory available for new processes." >> "${LOG_FILE}"
echo "Buffers and Cached memory improve disk performance." >> "${LOG_FILE}"
echo "Linux uses memory aggressively for caching to optimize speed." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 4: Memory Usage by Processes
###############################################################################
echo "=== SECTION 4: MEMORY USAGE BY PROCESSES ===" >> "${LOG_FILE}"

ps aux --sort=-%mem | head -n 10 >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "The top process listed is the highest memory consumer." >> "${LOG_FILE}"
echo "It may be a system or user process depending on ownership." >> "${LOG_FILE}"
echo "Uncontrolled memory usage can cause instability or thrashing." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 5: Swap Memory Analysis
###############################################################################
echo "=== SECTION 5: SWAP MEMORY ANALYSIS ===" >> "${LOG_FILE}"

swapon --show >> "${LOG_FILE}"
cat /proc/swaps >> "${LOG_FILE}"
grep SwapTotal /proc/meminfo >> "${LOG_FILE}"
grep SwapFree /proc/meminfo >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "If swap devices are listed above, swap is enabled." >> "${LOG_FILE}"
echo "SwapTotal indicates total configured swap space." >> "${LOG_FILE}"
echo "SwapFree shows how much swap space is currently unused." >> "${LOG_FILE}"
echo "Swap extends physical memory and prevents out-of-memory errors." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"



###############################################################################
# SECTION 6: Swappiness Parameter
###############################################################################
echo "=== SECTION 6: SWAPPINESS PARAMETER ===" >> "${LOG_FILE}"

cat /proc/sys/vm/swappiness >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "Swappiness controls how aggressively the kernel uses swap." >> "${LOG_FILE}"
echo "High swappiness values increase swap usage." >> "${LOG_FILE}"
echo "Low swappiness values prioritize keeping processes in RAM." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 7: Theoretical Relation
###############################################################################
echo "=== SECTION 7: THEORETICAL RELATION ===" >> "${LOG_FILE}"

echo "Physical memory is divided into frames." >> "${LOG_FILE}"
echo "Virtual memory is divided into pages." >> "${LOG_FILE}"
echo "The MMU translates virtual addresses into physical addresses." >> "${LOG_FILE}"
echo "Paging allows movement of pages between RAM and swap." >> "${LOG_FILE}"
echo "Thrashing occurs when excessive paging degrades performance." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 8: Conclusions
###############################################################################
echo "=== CONCLUSIONS ===" >> "${LOG_FILE}"

echo "Linux manages RAM efficiently using cache and buffers." >> "${LOG_FILE}"
echo "Low free RAM is not necessarily a problem because cached memory can be reused." >> "${LOG_FILE}"
echo "Swap complements RAM when physical memory becomes limited." >> "${LOG_FILE}"
echo "Paging is a memory management technique that moves pages between RAM and swap." >> "${LOG_FILE}"
echo "Excessive paging can reduce performance if the system enters thrashing." >> "${LOG_FILE}"
echo "Efficient memory management improves system stability and performance." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"
echo "The paging mechanism helps optimize memory usage." >> "${LOG_FILE}"

