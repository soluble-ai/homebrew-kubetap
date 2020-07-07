class Kubetap < Formula
  desc "Proxy Kubernetes Services with ease"
  homepage "https://github.com/soluble-ai/kubetap"
  url "https://github.com/soluble-ai/kubetap/archive/v0.1.2.tar.gz"
  sha256 "c1eb920c0c74dff72ec2cfded9286cd4dcf6887a0b292ab9c52aa3b8a0d00cdc"
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
