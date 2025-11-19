class DeiAlg < Formula
  desc "God Class Detector written in ALGOL 68"
  homepage "https://github.com/GriffinCanCode/Dei"
  license "MIT"
  head "https://github.com/GriffinCanCode/Dei.git", branch: "main"

  depends_on "algol68g"

  def install
    cd "dei-algolang" do
      bin.install "dei.alg" => "dei-alg"
      (bin/"dei-alg").write <<~EOS
        #!/bin/bash
        exec a68g "#{prefix}/dei.alg" -- "$@"
      EOS
      chmod 0755, bin/"dei-alg"
      prefix.install Dir["**/*.alg"]
    end
  end

  test do
    (testpath/"test.rs").write <<~RUST
      pub struct TestClass {
          field1: i32,
          field2: String,
      }

      impl TestClass {
          pub fn method1(&self) -> i32 { self.field1 }
          pub fn method2(&self) -> &str { &self.field2 }
          pub fn method3(&self) {}
          pub fn method4(&self) {}
          pub fn method5(&self) {}
      }
    RUST

    system bin/"dei-alg", "check", testpath
  end
end

