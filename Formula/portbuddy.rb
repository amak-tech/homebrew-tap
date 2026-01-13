class PortBuddy < Formula
  desc "A tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.2-beta" # This will be updated by your CI

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
    sha256 "28737e4d4607c1183ce85e0aed24b6fe212aeb9f56352e12b0454047424710c8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
    sha256 "28737e4d4607c1183ce85e0aed24b6fe212aeb9f56352e12b0454047424710c8"
  end

  def install
    # Rename the downloaded binary to 'port-buddy' and install it in the bin directory
    binary_name = OS.mac? && Hardware::CPU.arm? ? "portbuddy-macos-arm64" : "portbuddy-macos-x64"
    bin.install binary_name => "portbuddy"
  end

  test do
    system "#{bin}/portbuddy", "--help"
  end
end