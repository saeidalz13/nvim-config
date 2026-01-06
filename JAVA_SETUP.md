# Java Development Setup for Neovim

This configuration provides a complete Java development environment with LSP, debugging, testing, formatting, and linting.

## Features

### LSP (Language Server Protocol)
- **jdtls** - Eclipse JDT Language Server (managed by nvim-java)
- Code completion with intelligent suggestions
- Go to definition, references, and implementations
- Code actions and quick fixes
- Inlay hints for parameter names
- Code lens for references and implementations
- Automatic import organization

### Debugging
- Full debugging support via nvim-dap
- Java Debug Adapter configured
- Run and debug tests
- Breakpoints, step through code, inspect variables

### Testing
- Run individual tests or entire test classes
- View test reports
- Debug tests with breakpoints

### Formatting
- **google-java-format** - Automatic code formatting
- AOSP style (4 spaces indentation)
- Format on save (if enabled in LazyVim)

### Linting
- **checkstyle** - Static code analysis
- Google Java Style checks
- Real-time diagnostics

### Build Tools
- Maven support (pom.xml)
- Gradle support (build.gradle, build.gradle.kts, settings.gradle)
- Spring Boot Tools integration

## Keymaps

All Java-specific keymaps use the `<leader>j` prefix (by default `<space>j`):

| Keymap | Description |
|--------|-------------|
| `<leader>jc` | Compile the entire Java project |
| `<leader>jr` | Run the Java application |
| `<leader>jt` | Run the test under cursor |
| `<leader>jT` | Run all tests in the current class |
| `<leader>jd` | Debug the test under cursor |
| `<leader>jD` | Debug all tests in the current class |
| `<leader>jo` | Organize imports |
| `<leader>je` | View test execution report |
| `<leader>jR` | Refresh DAP (debugger) configuration |

## Standard LSP Keymaps (LazyVim defaults)

| Keymap | Description |
|--------|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format document |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<leader>cd` | Line diagnostics |

## Project Setup

### Requirements
- Java 21 (OpenJDK) - Already installed
- Maven or Gradle (for build management)

### Starting a New Project

The LSP will automatically detect Java projects by looking for:
- `pom.xml` (Maven)
- `build.gradle` or `build.gradle.kts` (Gradle)
- `settings.gradle` or `settings.gradle.kts` (Gradle)
- `mvnw` or `gradlew` (wrapper scripts)

### First Time Setup

1. Open any `.java` file in your project
2. nvim-java will automatically:
   - Download and configure jdtls
   - Set up the workspace
   - Install Java debug adapter and test runner
   - Start the language server

3. Wait for the LSP to fully initialize (check statusline)

## Troubleshooting

### LSP Not Starting
- Make sure you're in a Java project directory (with pom.xml or build.gradle)
- Check `:LspInfo` to see LSP status
- Try `:LspRestart` to restart the language server

### Debugging Not Working
- Run `<leader>jR` to refresh DAP configuration
- Make sure java-debug-adapter is installed: `:Mason`

### Formatting Issues
- Verify google-java-format is installed: `:Mason`
- Check `:ConformInfo` for formatter status

### Tools Installation
- Open Mason with `:Mason`
- Ensure these are installed:
  - java-debug-adapter
  - java-test
  - google-java-format
  - checkstyle

## Tips

1. **Import organization**: Use `<leader>jo` to automatically organize and clean up imports
2. **Code actions**: Use `<leader>ca` on errors/warnings for quick fixes
3. **Test development**: Write tests and use `<leader>jt` for quick feedback
4. **Debugging**: Set breakpoints with `<leader>db` and debug tests with `<leader>jd`
5. **Spring Boot**: Spring Boot tools are enabled for enhanced Spring development

## File Structure

Configuration files:
- `lua/plugins/java.lua` - Main Java plugin configuration
- `lua/plugins/mason.lua` - Tool installation configuration
- `lua/plugins/formatting.lua` - Code formatting configuration
- `lua/plugins/linting.lua` - Code linting configuration
- `lang-servers/intellij-java-google-style.xml` - Java code style definition
