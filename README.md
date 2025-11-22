# Homebrew Tap for Dei

God Class Detector tools in multiple languages.

## Available Formulas

- **dei-cs**: C# analyzer using Roslyn
- **dei-rs**: High-performance Rust implementation
- **dei-alg**: ALGOL 68 implementation

## Installation

```bash
brew tap GriffinCanCode/dei
brew install dei-cs
brew install dei-rs
brew install dei-alg
```

Or install directly:

```bash
brew install GriffinCanCode/dei/dei-cs
brew install GriffinCanCode/dei/dei-rs
brew install GriffinCanCode/dei/dei-alg
```

## Usage

```bash
dei-cs check /path/to/project  # C# version
dei check /path/to/project     # Rust version (from dei-rs formula)
dei-alg check /path/to/project # ALGOL version
```

## License

MIT
