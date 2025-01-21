### This Bash script searches for files with specific extensions in a specified directory, displaying or saving their content.



#### Usage:

```
./fetch_content.sh -p <search_dir> -e <extensions (comma-separated)> [-o output_file]
```

#### where
- `<search_dir>` is the target directory path.
- `<extensions>` are the file extensions (like `txt,csv`).
- `[-o output_file]` is optional for saving the output to a file, if not passed, it will be echoed to the terminal.
