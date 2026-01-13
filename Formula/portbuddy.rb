class Portbuddy < Formula
  desc "Tool to share a port opened on the local host to the public network"
  homepage "https://portbuddy.dev"
  version "1.0.6-beta" # This will be updated by your CI

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-x64"
      sha256 "b9d17bbbf2a29836fde07bc9ecc211e1648e19a68301a27284491e59a03714e2"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-macos-arm64"
      sha256 "c810e46cd781bb3de2499949db0c4646e2b5ad018e9cb24039548e9ccb3a9350"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-x64"
      sha256 "d2741d30f7378d302d9bf3ad3b85ab006adcc5b5c3554d34b52e8a8eaa558815"
    elsif Hardware::CPU.arm?
      url "https://github.com/amak-tech/port-buddy/releases/download/#{version}/portbuddy-linux-arm64"
      sha256 "88e810c25c59ea54d7dbb2da699208c6e9e44b8bb6153d2247146428294dde51"
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
