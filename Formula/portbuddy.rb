class PortBuddy < Formula
  desc "Tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.4-beta" # This will be updated by your CI

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-x64"
      sha256 "d3d225f8719d7c29b3dfd78a1fcfe71832f416d99de6eae6bf06bc3c4d61ec87"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
      sha256 "dd488d51d7f80246f34cfa825fb4c8dee5cfa6635a51d6b13077c84ea68924d6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-x64"
      sha256 "633d67a45031daa7dac0f9a3cf379e61836e3dd6104258557dc1a841f197b9f3"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-arm64"
      sha256 "bfcaccf881131a46d7c4fe9cd11913e1ab6e29035fa3bb98cc6cdc9e0be9ac3d"
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
