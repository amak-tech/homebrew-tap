class Portbuddy < Formula
  desc "Tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.14" # This will be updated by your CI

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-x64"
      sha256 "bffeb8a5cfbc56069551d71fe2bd85bd981c1bf8f585e4b5c773c166877cc05c"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
      sha256 "b6df8fd1b87bc34ba57364dfee47daad4182dd3121ffadb9a1e7d9411eb100dc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-x64"
      sha256 "fd3c7ba4f659fd6c60b51459bf10b86f35f67c360f1ba986b9ba4d2a679628c5"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-arm64"
      sha256 "7a071a1a1f10ddbeec94d64288d4ced12131f61e9dc0e949b939f75e15ad560f"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        binary_name = "portbuddy-macos-x64"
      elsif Hardware::CPU.arm?
        binary_name = "portbuddy-macos-arm64"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        binary_name = "portbuddy-linux-x64"
      elsif Hardware::CPU.arm?
        binary_name = "portbuddy-linux-arm64"
      end
    end

    bin.install binary_name => "portbuddy"
  end

  test do
    system "#{bin}/portbuddy", "--help"
  end
end
