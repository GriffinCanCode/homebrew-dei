class DeiCs < Formula
  desc "God Class Detector - AST-based C# code analyzer for detecting god classes, god files, and god methods"
  homepage "https://github.com/GriffinCanCode/Dei"
  url "https://github.com/GriffinCanCode/Dei/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d52b2276af5e9dc51b54f1be9a4c4466fe39109a1b7e304824b069baf399b628"
  license "MIT"
  depends_on "dotnet"

  def install
    cd "backend" do
      system "dotnet", "publish", "src/GodClassDetector.Console/GodClassDetector.Console.csproj",
             "--configuration", "Release",
             "--framework", "net9.0",
             "--output", "#{buildpath}/publish",
             "--self-contained", "false"
    end

    libexec.install Dir["publish/*"]
    
    # Install appsettings.json
    (libexec/"appsettings.json").write <<~EOS
      {
        "DetectionThresholds": {
          "MaxLines": 300,
          "MaxMethods": 20,
          "MaxComplexity": 50,
          "MinClusterSize": 3,
          "ClusterThreshold": 0.7,
          "MaxMethodLines": 50,
          "MaxMethodComplexity": 10,
          "MaxMethodParameters": 5,
          "MaxClassesPerFile": 3,
          "MaxFileLinesOfCode": 500
        }
      }
    EOS

    # Create wrapper script
    (bin/"dei-cs").write <<~EOS
      #!/bin/bash
      exec dotnet "#{libexec}/GodClassDetector.Console.dll" "$@"
    EOS
  end

  test do
    # Create a simple test C# file
    test_file = testpath/"TestClass.cs"
    test_file.write <<~EOS
      public class TestClass
      {
          public void Method1() { }
          public void Method2() { }
      }
    EOS

    system bin/"dei-cs", "check", testpath.to_s
  end
end

