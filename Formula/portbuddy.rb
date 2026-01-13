class Portbuddy < Formula
  desc "Tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.5-beta" # This will be updated by your CI

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-x64"
      sha256 "7cd8d2397e77882b19de2466436e30b0eb1444ee98ea22958230eef5aec0aa4f"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
      sha256 "48b49214ad9d9adb258059526cfbabe7c1d5707f29940acf7ea047139ef2a2ea"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-x64"
      sha256 "1c5e2a3d01395c51e0bb3bc5f0b95bab8b45c990a65f7518bee6b7cfb95b90ae"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-arm64"
      sha256 "a6001bda266e5f54f16bd7353e223f7d2f4a74116b9b96c548327fd2a7d53ab7"
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
