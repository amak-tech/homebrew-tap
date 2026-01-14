class Portbuddy < Formula
  desc "Tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.9-beta" # This will be updated by your CI

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-x64"
      sha256 "45d82a655bb06c97fdee0e15bb66272804b947388909a2fc83b6727d38c198e7"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
      sha256 "49495823f7a2c575a427d7576b942c29deed96be4c936c03882b7e741f1010cb"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-x64"
      sha256 "925bd7c1fe88a317c4dedf0f2024c457ca34b53341ad68ba6a96eac4210fc8f4"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-arm64"
      sha256 "cf5596bbad13a1728d2057c38a4cb2311dd655d482130c60da50b993e71bd0a5"
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
