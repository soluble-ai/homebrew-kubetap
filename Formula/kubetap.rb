class Kubetap < Formula
  desc "Proxy Kubernetes Services with ease"
  homepage "https://github.com/soluble-ai/kubetap"
  url "https://github.com/soluble-ai/kubetap/archive/v0.1.0.tar.gz"
  sha256 "fd96d7e8880ab2fafe5b5d57997a7ab2cec57c0260655ba4b9a9c91bdb7ed566"
  head "https://github.com/soluble-ai/kubetap.git"
  
  bottle :unneeded

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./kubectl-tap", "-ldflags='-s -w'", "./cmd/kubectl-tap"
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
