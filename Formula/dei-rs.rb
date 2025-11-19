class DeiRs < Formula
  desc "God Class Detector (Rust) - High-performance AST-based code analyzer for detecting god classes"
  homepage "https://github.com/GriffinCanCode/Dei"
  url "https://github.com/GriffinCanCode/dei-rs/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "" # Will be filled when you create the release
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Create a simple test file
    test_file = testpath/"test.rs"
    test_file.write <<~EOS
      pub struct TestStruct {
          field1: String,
          field2: i32,
      }
      
      impl TestStruct {
          pub fn new() -> Self {
              TestStruct {
                  field1: String::from("test"),
                  field2: 0,
              }
          }
      }
    EOS

    system bin/"dei-rs", "check", testpath.to_s
  end
end

