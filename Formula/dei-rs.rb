class DeiRs < Formula
  desc "Blazingly fast code analyzer for detecting god classes (Rust edition)"
  homepage "https://github.com/GriffinCanCode/Dei"
  license "MIT"
  head "https://github.com/GriffinCanCode/Dei.git", branch: "main"

  # For now, head-only until first release
  depends_on "rust" => :build

  def install
    cd "dei-rs" do
      system "cargo", "install", *std_cargo_args(path: "crates/dei-cli")
    end
  end

  test do
    # Create a test Rust file
    (testpath/"test.rs").write <<~RUST
      pub struct HugeClass {
          field1: i32,
          field2: String,
          field3: Vec<u8>,
      }

      impl HugeClass {
          pub fn method1(&self) -> i32 { self.field1 }
          pub fn method2(&self) -> &str { &self.field2 }
          pub fn method3(&self) -> &[u8] { &self.field3 }
          pub fn method4(&self) {}
          pub fn method5(&self) {}
          pub fn method6(&self) {}
          pub fn method7(&self) {}
          pub fn method8(&self) {}
          pub fn method9(&self) {}
          pub fn method10(&self) {}
      }
    RUST

    # Run analysis
    system bin/"dei", "check", testpath, "--format", "json"
  end
end
