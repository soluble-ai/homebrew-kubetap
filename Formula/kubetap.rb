class Kubetap < Formula
  desc "Proxy Kubernetes Services with ease"
  homepage "https://github.com/soluble-ai/kubetap"
  url "https://github.com/soluble-ai/kubetap/archive/v0.1.1.tar.gz"
  sha256 "278561b39cb440d8cb26353aad7494f67049f2bbdf4d41dc43bb3917556b76e7"
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
