class Kubetap < Formula
  desc "Proxy Kubernetes Services with ease"
  homepage "https://github.com/soluble-ai/kubetap"
  url "https://github.com/soluble-ai/kubetap/archive/v0.0.1.tar.gz"
  sha256 "1cd7e2eee998bb48770a83354c31f067ec8201ce248834a02eafba9112be9195"
  head "https://github.com/soluble-ai/kubetap.git"
  
  bottle :unneeded

  depends_on "go" => :build

  def install
    system "./scripts/build.zsh"
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
