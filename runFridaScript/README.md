This Bash script allows you to select and run a JavaScript file using Frida, with an optional build step using a `build.sh` script.

**How to Use:**
1. Save the script in a `.sh` file, e.g., `run_frida.sh`.
2. Make it executable: `chmod +x run_frida.sh`.
3. Run it in a directory containing JavaScript files by executing: `./run_frida.sh`.
4. Optionally, use the `-b` flag to run `build.sh` before executing the selected script: `./run_frida.sh -b`.
5. Follow the on-screen prompts to select a JavaScript file and execute it with Frida.
