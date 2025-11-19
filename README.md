# Homebrew Tap for Dei

This is the Homebrew tap for Dei - God Class Detector tools.

## Available Formulas

### dei-cs (C# version)
AST-based C# code analyzer that detects:
- God Classes (classes with too many responsibilities)
- God Files (files with too many classes)
- God Methods (overly complex methods)

Uses Roslyn for C# parsing and K-means clustering for semantic analysis.

### dei-rs (Rust version) [Coming Soon]
High-performance Rust implementation of the Dei analyzer with support for multiple languages.

## Installation

### Install from this tap:

```bash
# Add the tap
brew tap GriffinCanCode/dei

# Install C# version
brew install dei-cs

# Install Rust version (when available)
brew install dei-rs
```

### Install directly:

```bash
# C# version
brew install GriffinCanCode/dei/dei-cs

# Rust version (when available)
brew install GriffinCanCode/dei/dei-rs
```

## Usage

### dei-cs

```bash
# Check current directory
dei-cs check .

# Check specific project
dei-cs check /path/to/your/csharp/project

# Legacy mode (single file)
dei-cs /path/to/YourClass.cs
```

### dei-rs (when available)

```bash
# Check current directory
dei-rs check .

# Check specific project
dei-rs check /path/to/your/project
```

## Configuration

Configuration files are located at:
- **dei-cs**: `$(brew --prefix)/opt/dei-cs/libexec/appsettings.json`

## Dependencies

- **dei-cs**: Requires .NET 9.0 runtime (automatically installed)
- **dei-rs**: No runtime dependencies (statically compiled)

## Documentation

- [Main Repository](https://github.com/GriffinCanCode/Dei)
- [C# Version Documentation](https://github.com/GriffinCanCode/Dei/tree/main/backend)
- [Rust Version Repository](https://github.com/GriffinCanCode/dei-rs) (Coming Soon)

## License

MIT License

