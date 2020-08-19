class Kubetap < Formula
  desc "Proxy Kubernetes Services with ease"
  homepage "https://github.com/soluble-ai/kubetap"
  url "https://github.com/soluble-ai/kubetap/archive/v0.1.3.tar.gz"
  sha256 "56251f6833618fb8d0fd9229f12e5e95fb2aa8c6d7f2338f7fc6e13457a7d477"
  head "https://github.com/soluble-ai/kubetap.git"
  
  bottle :unneeded

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./kubectl-tap", "-ldflags=-s", "-ldflags=-w", "./cmd/kubectl-tap"
    bin.install "./kubectl-tap"
  end

  test do
    system "#{bin}/kubectl-tap version"
  end

  def caveats
    <<~EOS
      kubetap is best invoked as:
      $ kubectl tap
    EOS
  end
end
