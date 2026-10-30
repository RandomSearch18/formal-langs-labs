#!/usr/bin/env python3
# Credits: Copyright Joel Day, Loughborough University
import sys
import subprocess


def main():
    if len(sys.argv) < 3:
        print(f"Usage: python {sys.argv[0]} <tests_file> <executable>", file=sys.stderr)
        sys.exit(1)

    tests_file = sys.argv[1]
    executable = sys.argv[2]

    try:
        with open(tests_file, "r", encoding="utf-8") as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Test file '{tests_file}' not found.", file=sys.stderr)
        sys.exit(1)

    failed_count = 0

    for line_num, line in enumerate(lines, 1):
        # Strip the trailing newline/carriage return, keeping the rest of the line content intact
        test_input = line.rstrip("\r\n")

        try:
            # Run the executable, passing the test string via stdin and closing it (EOF)
            # Stdout is captured and suppressed; stderr is captured for reporting.
            result = subprocess.run(
                [executable],
                input=test_input,
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
        except Exception as e:
            print(f"[-] Line {line_num}: Failed to launch executable: {e}")
            continue

        # Check if the program crashed or exited with an error code
        if result.returncode != 0:
            failed_count += 1
            print(f"[!] Test Failure on Line {line_num}")
            print(f"    Exit Code: {result.returncode}")
            if result.stderr.strip():
                print("    Stderr Output:")
                for stderr_line in result.stderr.strip().splitlines():
                    print(f"      {stderr_line}")
            print("-" * 40)

    print(
        f"\nFinished running {len(lines)} tests. Found {failed_count} failures/crashes."
    )


if __name__ == "__main__":
    main()
